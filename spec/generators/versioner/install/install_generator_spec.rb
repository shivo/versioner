require 'spec_helper'

# Generators are not automatically loaded by Rails
require 'generators/versioner/install/install_generator'

describe Versioner::InstallGenerator do
  # Tell the generator where to put its output
  destination File.expand_path("../../../../../tmp", __FILE__)

  before { prepare_destination }

  describe 'no arguments' do
    before { run_generator }

    describe 'config/versioner.yml' do
      subject { file('config/versioner.yml') }
      it { should exist }
      it { should contain "major: 0" }
      it { should contain "minor: 0" }
      it { should contain "patch: 1" }
    end

    describe 'config/initializers/versioner.rb' do
      subject { file('config/initializers/versioner.rb') }
      it { should exist }
      it { should contain "Versioner.configure do |config|" }
      it { should contain "storage_path"}
    end
  end
end
