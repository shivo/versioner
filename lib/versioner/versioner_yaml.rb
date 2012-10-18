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

    def minor
      data[:minor]
    end

    def patch
      data[:patch]
    end

    def force(major, minor, patch)
      self.major = major
      self.minor = minor
      self.patch = patch
      write
      version
    end

    def increment_major
      self.major = major + 1
      self.minor = 0
      self.patch = 0
      write
      version
    end

    def increment_minor
      self.minor = minor + 1
      self.patch = 0
      write
      version
    end

    def increment_patch
      self.patch = patch + 1
      write
      version
    end

    private

    attr_accessor :data, :path

    def read
      File.open(path, 'r') do |file|
        data = file.read
        self.data = YAML.load(data)
      end
    end

    def write
      File.open(path, 'w') do |file|
        YAML.dump(data, file)
      end
    end

    def major=(num)
      data[:major] = num
    end

    def minor=(num)
      data[:minor] = num
    end

    def patch=(num)
      data[:patch] = num
    end
  end
end