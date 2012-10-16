require 'yaml'

module Versioner
  class YamlBackend
    def initialize(path)
      self.path = path
      read
    end

    def version
      "#{major}.#{minor}.#{patch}"
    end

    def major
      data[:major]
    end

    def major=(num)
      data[:major] = num
      write
    end

    def minor
      data[:minor]
    end

    def minor=(num)
      data[:minor] = num
      write
    end

    def patch
      data[:patch]
    end

    def patch=(num)
      data[:patch] = num
      write
    end

    def force(major, minor, patch)
      self.major = major
      self.minor = minor
      self.patch = patch
      version
    end

    def increment_major
      self.major = major + 1
      version
    end

    def increment_minor
      self.minor = minor + 1
      version
    end

    def increment_patch
      self.patch = patch + 1
      version
    end

    private

    attr_accessor :data, :path

    def read
      self.data = YAML.load(File.read(path)).with_indifferent_access
    end

    def write
      YAML.dump data, File.open(path, 'w')
    end
  end
end