# Sinatra::Sprockets

Sinatra extension for Sprockets integration.

## Installation

Add this line to your application's Gemfile:

    gem 'sinatra-sprockets-ext', :require => 'sinatra/sprockets'

Currently requires 1.9 (1.8 is near end-of-life anyway).

## Usage

Register the plugin in your `app.rb`:

    register Sinatra::Sprockets

In your `config.ru`, add a mapping for Sprockets:

    map "/#{Sinatra::Sprockets.config.prefix}" do
      run Sinatra::Sprockets.environment
    end

Optionally configure as needed. Configuration is similar to Rails's Asset Pipeline.
Below is an example configuration with some options showing the default values:

    Sinatra::Sprockets.configure do |config|
      config.compile = false         # On-the-fly compilation
      config.compress = false        # Compress assets
      config.digest = false          # Append a digest to URLs
      config.css_compressor = false  # CSS compressor instance
      config.js_compressor = false   # JS compressor instance
    end

All options and their defaults are shown in `lib/sinatra-sprockets/configuration.rb`.

You'll also get helper functions that will be familiar to those who use Rails:

- `javascript_include_tag :asset_name`
- `stylesheet_link_tag :asset_name`
- `asset_path :asset_name`

## Credits & License

Copyright ©2012 J. Andrew Marshall. All rights reserved.
License is available in the LICENSE file.
