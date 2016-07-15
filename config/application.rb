require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FelipenoratoIsProficiencyTest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << "#{Rails.root}/app/enumerations"
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    config.encoding = "utf-8"
   end
end
