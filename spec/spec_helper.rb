require 'fileutils'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
require "rspec/autorun"

require "versioner"

# copy over new versioner config
fixture_path = File.expand_path("../fixtures/versioner.yml", __FILE__)
storage_path = File.expand_path("../dummy/config/versioner.yml", __FILE__)
FileUtils.cp fixture_path, storage_path

require "ammeter/init"
