# frozen_string_literal: true

module Api
  # base controller for api
  class BaseController < ActionController::Base
    before_action :require_login!
    helper_method :user_signed_in?, :current_user

    def user_signed_in?
      current_user.present?
    end

    def require_login!
      return true if authenticate_token
      render json: { errors: [{ detail: 'Access denied' }] }, status: 401
    end

    def current_user
      @current_user ||= authenticate_token
    end

    private

    def authenticate_token
      authenticate_with_http_token do |token, _options|
        User.where(auth_token: token)
            .where('token_created_at >= ?', 1.minute.ago).first
      end
    end
  end
end
