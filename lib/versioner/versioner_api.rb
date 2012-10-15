class VersionerApi
  def version
    @version ||= "0.0.0"
  end

  def force(version)
    @version = version
  end

  def increment_major
    version_parts = @version.split('.')
    version_parts[0] = (version_parts[0].to_i + 1).to_s
    @version = version_parts.join('.')
  end
end
