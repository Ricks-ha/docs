require_relative 'boot'

# require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

module Docs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Central Time (US & Canada)'

    SecureHeaders::Configuration.default do |config|
      config.csp = {
        # "meta" values. these will shape the header, but the values are not included in the header.
         preserve_schemes: true, # default: false. Schemes are removed from host sources to save bytes and discourage mixed content.

         # directive values: these values will directly translate into source directives
         default_src: %w(https: 'self'),
         base_uri: %w('self'),
         block_all_mixed_content: true, # see http://www.w3.org/TR/mixed-content/
         child_src: ["'self'"],
         connect_src: ["'self'"],
         font_src: %w('self'),
         form_action: %w('self' ),
         frame_ancestors: ["'self'"], # if child-src isn't supported, the value for frame-src will be set.
         img_src: %w('self' * piwik.standardnotes.org data:),
         manifest_src: %w('self'),
         media_src: %w('self'),
         object_src: %w('self'),
         plugin_types: %w(),
         script_src: %w('self' 'unsafe-inline' piwik.standardnotes.org *),
         style_src: %w('self' 'unsafe-inline' ),
         upgrade_insecure_requests: false # see https://www.w3.org/TR/upgrade-insecure-requests/
      }
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
