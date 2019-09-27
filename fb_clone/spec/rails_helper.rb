# frozen_string_literal: true
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'database_cleaner'
require 'capybara/rspec'
abort('The Rails environment is running in production mode!') if Rails.env.production?
ActiveRecord::Migration.maintain_test_schema!
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :selenium_chrome
RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.before(:all) do
    DatabaseCleaner.start
  end
  config.after(:all) do
    DatabaseCleaner.clean
  end
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
Capybara.default_driver = :selenium_chrome
