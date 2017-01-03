require_relative '../rails_helper'

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure(&:block_unknown_urls)

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.include FeaturesMacros, type: :feature

  config.before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

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
