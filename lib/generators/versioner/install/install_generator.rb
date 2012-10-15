require 'rbconfig'

module Versioner
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    DEFAULT_SHEBANG = File.join(RbConfig::CONFIG['bindir'], RbConfig::CONFIG['ruby_install_name'])

    def create_version_file
      template 'config/versioner.yml.erb', 'config/versioner.yml'
    end
  end
end
