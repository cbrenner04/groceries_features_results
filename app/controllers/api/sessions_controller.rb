# frozen_string_literal: true

module Api
  # sessions controller for api
  class SessionsController < Api::BaseController
    skip_before_action :require_login!, only: [:create]

    def create
      resource = User.find_for_database_authentication(
        email: login_params[:email]
      )
      resource ||= User.new

      if resource.valid_password?(login_params[:password])
        auth_token = resource.generate_auth_token
        render json: { auth_token: }
      else
        invalid_login_attempt
      end
    end

    def destroy
      resource = current_user
      resource.invalidate_auth_token
      head :ok
    end

    private

    def login_params
      params.expect(user_login: %i[email password])
    end

    def invalid_login_attempt
      render json: {
        errors: [{ detail: 'Error with your login or password' }]
      }, status: :unauthorized
    end
  end
end
