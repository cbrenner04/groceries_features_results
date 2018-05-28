# frozen_string_literal: true

# results controller
class ResultsController < ApplicationController
  def index
    @feature = Feature.find(params[:feature_id])
    @results = @feature.results
  end
end
