require "versioner/versioner_yaml"

module Versioner
  class << self
    def api
      @api ||= YamlBackend.new(storage_path)
    end

    def version
      api.version
    end

    def force(major, minor, patch)
      api.force major, minor, patch
    end

    def increment_major
      api.increment_major
    end

    def increment_minor
      api.increment_minor
    end

    def increment_patch
      api.increment_patch
    end

    def storage_path
      @storage_path ||= Rails.root.join("config", "versioner.yml")
    end

    def storage_path=(path)
      @storage_path = path
    end
  end
end
