require_relative "boot"

require "rails"
require "active_storage/engine" # Keep only one uncommented line for ActiveStorage

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module SiteTerreiro
  class Application < Rails::Application
    # Keep existing configurations
    config.time_zone = 'Brasilia'
    config.i18n.available_locales = [:en, :pt]
    config.i18n.default_locale = :pt

    # Propshaft configuration
    config.assets.prefix = "/assets"
    config.assets.paths = [
      Rails.root.join("app/assets").to_s # Convert Pathname to string explicitly
    ]
    config.assets.resolve_urls = true


    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])

  end
end