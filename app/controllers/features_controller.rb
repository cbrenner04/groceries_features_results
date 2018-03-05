# frozen_string_literal: true

# features controller
class FeaturesController < ApplicationController
  def index
    @features = Feature.all
  end
end
