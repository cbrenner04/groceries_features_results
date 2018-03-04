# frozen_string_literal: true

# model for individual results of each feature
class Result < ApplicationRecord
  belongs_to :feature

  validates :feature, :duration, presence: true
  validates :passed, inclusion: { in: [true, false] }
end
