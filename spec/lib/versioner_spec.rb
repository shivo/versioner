require 'spec_helper'

describe Versioner do
  it "should report a default version if none is set" do
    version = Versioner.version
    version.should == "0.0.0"
  end

  it "should set the current version via force" do
    Versioner.force "0.0.1"
    version = Versioner.version
    version.should == "0.0.1"
  end

  it "should increment the major version" do
    Versioner.force "0.0.1"
    Versioner.increment_major
    version = Versioner.version
    version.should == "1.0.1"
  end
end
