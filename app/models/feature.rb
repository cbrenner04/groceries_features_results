# frozen_string_literal: true

# model for holding general information about features
class Feature < ApplicationRecord
  has_many :results, dependent: :destroy

  validates :rspec_id, :description, presence: true

  def status
    results.first.passed ? 'passing' : 'failing'
  end

  def last_passed
    last_passing = results.passing.first
    last_passing ? last_passing.created_at.to_fs(:long) : 'n/a'
  end
end
