require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    config.active_support.deprecation = :raise

    config.active_record.legacy_connection_handling = false if Gem::Version.new(Rails.version) < Gem::Version.new('7.1')
  end
end
