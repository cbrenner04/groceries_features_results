# frozen_string_literal: true

# user model
class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  # for api
  def generate_auth_token
    token = SecureRandom.hex
    update!(auth_token: token, token_created_at: Time.zone.now)
    token
  end

  def invalidate_auth_token
    update!(auth_token: nil, token_created_at: nil)
  end
end
