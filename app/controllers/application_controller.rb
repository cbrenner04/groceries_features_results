# frozen_string_literal: true

# top level controller class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
end
