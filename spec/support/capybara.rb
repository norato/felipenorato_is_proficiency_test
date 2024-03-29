require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.always_include_port = true
Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :rack_test
Capybara.default_max_wait_time = 5

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, timeout: 60)
end
