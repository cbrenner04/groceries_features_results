# frozen_string_literal: true

# model for individual results of each feature
class Result < ApplicationRecord
  belongs_to :feature

  validates :feature, :duration, :environment, :test_run, presence: true
  validates :passed, inclusion: { in: [true, false] }

  default_scope { order(created_at: :desc) }
  scope :passing, (-> { where(passed: true) })
  scope :test_run, ->(test_run) { where(test_run: test_run) }

  def self.test_runs
    pluck(:test_run).uniq.map { |time| Time.at(time.to_i)}
  end
end
