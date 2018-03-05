# frozen_string_literal: true

# top level controller class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :set_timezone

  def set_timezone
    Time.zone = 'Central Time (US & Canada)'
  end
end
