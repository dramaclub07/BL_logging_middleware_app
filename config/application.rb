require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

require_relative "../app/middleware/request_logger"

module LoggingMiddlewareApp
  class Application < Rails::Application 
    config.middleware.use RequestLogger  #adding to stack
    #config.middleware.use AgeCheckMiddleware
    config.load_defaults 8.0
    # config.autoload_lib(ignore: %w[assets tasks])
    # config.api_only = true
  end
end
