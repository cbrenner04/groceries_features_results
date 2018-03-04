# frozen_string_literal: true

# top level mailer class
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@groceries_features_results.com'
  layout 'mailer'
end
