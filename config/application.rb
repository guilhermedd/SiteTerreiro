require_relative "boot"

require "rails"
require "active_storage/engine" # Keep only if you're using ActiveStorage

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
    config.assets.css_compressor = :sass

    config.i18n.available_locales = [:en, :pt]
    config.i18n.default_locale = :pt

    # Explicitly set asset paths
    config.assets.paths += [
      Rails.root.join("app", "assets", "images"),
      Rails.root.join("app", "assets", "javascripts"),
      Rails.root.join("app", "assets", "stylesheets")
    ]
    config.assets.enabled = true


    # Let Propshaft handle the asset paths automatically
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
  end
end

