require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = ENV["TZ"]
    # config.eager_load_paths << Rails.root.join("extras")
    config.api_only = true

    # データベースの読み書きに使用するタイムゾーン(:local | :utc(default))
    config.active_record.default_timezone = :utc
  end
end
