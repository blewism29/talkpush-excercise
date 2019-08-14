require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TalkpushExcercise

  class Application < Rails::Application

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.autoload_paths += Dir["#{config.root}/lib/managers"]
    config.autoload_paths += Dir["#{config.root}/lib/services"]
    config.autoload_paths += Dir["#{config.root}/lib/tools"]

    config.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")

    require_relative 'app_jobs'
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
