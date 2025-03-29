# frozen_string_literal: true

module Api
  # results controller for api
  class ResultsController < Api::BaseController
    def create
      result = Result.new(result_params)

      if result.save
        render json: { result_id: result.id }
      else
        invalid_result_creation
      end
    end

    private

    def result_params
      params.expect(
        result: %i[feature_id duration exception environment passed test_run]
      )
    end

    def invalid_result_creation
      render json: {
        errors: [{ detail: 'Error creating result' }]
      }, status: :unprocessable_entity
    end
  end
end
