module Sinatra::Sprockets
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

  class Configuration < Struct.new(*DEFAULT_OPTIONS.keys)
    attr_accessor *DEFAULT_OPTIONS.keys, :digests

    def initialize
      DEFAULT_OPTIONS.each do |key, value|
        send "#{key}=".to_sym, value
      end
      @digests = {}
    end
  end
end
