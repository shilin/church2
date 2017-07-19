require_relative '../rails_helper'

# require 'capybara/poltergeist'
# Capybara.register_driver :poltergeist_debug do |app|
#   Capybara::Poltergeist::Driver.new(app, :inspector => true)
# end
# Capybara.javascript_driver = :webkit

Capybara.javascript_driver = :selenium
# Capybara.javascript_driver = :poltergeist_debug

Capybara::Webkit.configure(&:block_unknown_urls)

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.include FeaturesMacros, type: :feature

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
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
end
