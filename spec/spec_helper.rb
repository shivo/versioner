# rails
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

# versioner
require "fileutils"
require "versioner"
Versioner.configure do |config|
  config.storage_path = Rails.root.join "config", "versioner.yml"
end

# copy over new versioner config
fixture_path = File.expand_path("../fixtures/versioner.yml", __FILE__)
storage_path = File.expand_path("../dummy/config/versioner.yml", __FILE__)
FileUtils.cp fixture_path, storage_path

require "rspec/rails"
require "rspec/autorun"

require "ammeter/init"
