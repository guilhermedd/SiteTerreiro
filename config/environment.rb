# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
# Initialize Propshaft asset pipeline

Rails.application.config.assets = ActiveSupport::OrderedOptions.new if Rails.application.config.assets.nil?
Rails.application.initialize!