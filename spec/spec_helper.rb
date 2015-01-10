require 'rubygems'
require 'bundler/setup'

Dir.glob("spec/steps/**/*steps.rb") { |f| load f, true }

require 'capybara/dsl'
require 'capybara/rspec'
require 'turnip'
require 'turnip/capybara'
require 'capybara/poltergeist'
# require 'capybara-webkit'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  config.javascript_driver = :poltergeist
  # config.default_driver = :webkit
  # config.javascript_driver = :webkit
  config.app = 'project'
end
