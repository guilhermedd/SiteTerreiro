require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Initialize Propshaft assets
  config.assets ||= ActiveSupport::OrderedOptions.new

  # Settings specified here will take precedence over those in config/application.rb.
  config.enable_reloading = true
  config.eager_load = false
  config.active_storage.service = :local

  # Action Mailer Configuration
  config.action_mailer.default_options = { from: 'example@trial-3zxk54vekx6ljy6v.mlsender.net' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.mailersend.net',
    port: ENV['SMTP_PORT'],
    domain: ENV['SMTP_DOMAIN'],
    user_name: ENV['SMTP_USERNAME'],
    password: ENV['SMTP_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Other configurations...
  config.consider_all_requests_local = true
  config.server_timing = true
end