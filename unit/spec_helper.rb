# frozen_string_literal: true

require 'rspec'
require 'bundler/setup'
require_relative '../framework/app_manager/app_manager'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation # Use detailed output format
end
