require "versioner/versioner_api"

module Versioner
  @api = VersionerApi.new

  def self.version
    @api.version
  end

  def self.force(version)
    @api.force version
  end

  def self.increment_major
    @api.increment_major
  end
end
