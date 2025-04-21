require_relative "boot"

require "rails"
require "active_storage/engine"       
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

require "propshaft/railtie"

module SiteTerreiro
  class Application < Rails::Application
    config.load_defaults 8.0
    config.time_zone = 'Brasilia'
    config.i18n.available_locales = [:en, :pt]
    config.i18n.default_locale = :pt
    
    config.autoload_lib(ignore: %w[assets tasks])
  end
end
