ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'capybara/json'

require_relative '../shared_helpers.rb'

Capybara.app = Billski::Application
