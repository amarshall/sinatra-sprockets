module Sinatra::Sprockets
  class Configuration
    DEFAULT_OPTIONS = {
      app: nil,
      debug: false,
      digest: false,
      compile: false,
      compress: false,
      host: nil,
      manifest_path: 'public/assets',
      paths: %w[images javascripts stylesheets],
      precompile: [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ],
      prefix: 'assets',
      relative_url_root: ENV['RACK_RELATIVE_URL_ROOT'],
      css_compressor: false,
      js_compressor: false
    }
    attr_accessor :digests, *DEFAULT_OPTIONS.keys

    def initialize
      DEFAULT_OPTIONS.each do |key, value|
        instance_variable_set :"@#{key}", value
      end
      @digests = {}
    end
  end
end
