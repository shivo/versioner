require 'fileutils'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
require "rspec/autorun"

require "versioner"
fixture_path = File.expand_path("../fixtures/versioner.yml", __FILE__)
storage_path = File.expand_path("../../tmp/config/versioner.yml", __FILE__)
FileUtils.cp fixture_path, storage_path
Versioner.storage_path = storage_path

require "ammeter/init"
