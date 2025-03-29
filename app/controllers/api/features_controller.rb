# frozen_string_literal: true

module Api
  # features controller for api
  class FeaturesController < Api::BaseController
    def create
      feature = Feature.find_or_initialize_by(feature_params)

      if feature.save
        render json: { feature_id: feature.id }
      else
        invalid_feature_creation
      end
    end

    private

    def feature_params
      params.expect(feature: %i[rspec_id description])
    end

    def invalid_feature_creation
      render json: {
        errors: [{ detail: 'Error creating feature' }]
      }, status: :unprocessable_entity
    end
  end
end
