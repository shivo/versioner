require 'spec_helper'

describe Versioner do
  describe "getting a version if none is set" do
    subject { Versioner.version }
    it { should == "0.0.0" }
  end

  describe "forcing the version" do
    before { Versioner.force 1, 0, 0 }
    subject { Versioner.version }
    it { should == "1.0.0" }
  end

  describe "incrementing the major version" do
    before do
      Versioner.force 1, 0, 1
      Versioner.increment_major
    end
    subject { Versioner.version }
    it { should == "2.0.0" }
  end

  describe "incrementing the minor version" do
    before do
      Versioner.force 1, 0, 1
      Versioner.increment_minor
    end
    subject { Versioner.version }
    it { should == "1.1.0" }
  end

  describe "incrementing the patch version" do
    before do
      Versioner.force 2, 3, 1
      Versioner.increment_patch
    end
    subject { Versioner.version }
    it { should == "2.3.2" }
  end
end
