# frozen_string_literal: true

module Api
  # sessions controller for api
  class HomesController < Api::BaseController
    def show
      render json: 'Hello, World!', status: :ok
    end
  end
end
