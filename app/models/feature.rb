# frozen_string_literal: true

# model for holding general information about features
class Feature < ApplicationRecord
  has_many :results, dependent: :destroy

  validates :rspec_id, :description, presence: true
end
