require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hackingedu
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
