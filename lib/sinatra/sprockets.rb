require "sprockets"
require "sinatra/sprockets/version"
require "sinatra/sprockets/asset_paths"
require "sinatra/sprockets/configuration"
require "sinatra/sprockets/helpers"

module Sinatra
  module Sprockets
    def self.configure
      yield config
    end

    def self.config
      @config ||= Configuration.new
    end

    def self.environment
      @environment
    end

    def self.registered app
      config.app = app

      @environment = ::Sprockets::Environment.new app.root

      config.paths.each do |path|
        environment.append_path File.join(config.app.root, config.prefix, path)
        environment.append_path File.join(config.app.root, 'lib', config.prefix, path)
      end

      if config.compress
        environment.css_compressor = config.css_compressor
        environment.js_compressor = config.js_compressor
      end

      app.helpers Helpers
      environment.context_class.instance_eval do
        include Helpers
      end
    end
  end
end
