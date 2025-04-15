require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot for better performance and memory savings.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Enable server timing.
  config.server_timing = true


  # Enable/disable Action Controller caching.
  config.action_controller.perform_caching = true

  # Use a different cache store in production.
  config.cache_store = :memory_store
  config.active_storage.service = :amazon


  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Set host to be used by links generated in mailer templates.
  config.action_mailer.default_url_options = { host: 'https://tendaumbanda.onrender.com' }
  config.action_mailer.default_options = { from: 'example@trial-3zxk54vekx6ljy6v.mlsender.net' }

  config.action_mailer.perform_caching = false

  # Configure Action Mailer for SMTP delivery.
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.mailersend.net',
    port: ENV['SMTP_PORT'],
    domain: ENV['SMTP_DOMAIN'],  # Usando a variável de ambiente
    user_name: ENV['SMTP_USERNAME'],  # Usando a variável de ambiente
    password: ENV['SMTP_PASSWORD'],  # Usando a variável de ambiente
    authentication: 'plain',  # Usualmente 'plain' para a maioria dos SMTPs
    enable_starttls_auto: true  # Para garantir uma conexão segura
  }

  config.assets.compile = true
  config.assets.digest = true
  config.assets.version = '1.0'


  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end