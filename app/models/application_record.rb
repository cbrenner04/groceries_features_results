# frozen_string_literal: true

# top level model class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
