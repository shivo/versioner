require 'yaml'

module Versioner
  class YamlBackend
    def initialize(path)
      self.path = path
      read
    end

    def version
      "#{major}.#{minor}.#{patch}" + (build ? "+#{build}" : "" )
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
    
    def build
      data[:build]
    end

    def force(major, minor, patch, build = nil)
      self.major = major
      self.minor = minor
      self.patch = patch
      self.build = build
      write
      version
    end

    def increment_major
      self.major = major + 1
      self.minor = 0
      self.patch = 0
      self.build = nil
      write
      version
    end

    def increment_minor
      self.minor = minor + 1
      self.patch = 0
      self.build = nil
      write
      version
    end

    def increment_patch
      self.patch = patch + 1
      self.build = nil
      write
      version
    end
    
    def set_build_from_git
      self.build = "build.#{git_revcount}.#{git_revdate}"
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

    def build=(str)
      data[:build] = str
    end   
    
    def git_revcount
      if File.exists?(".git")
        `git rev-list --count HEAD`.strip
      end
    end
      
    def git_revdate  
      if File.exists?(".git")
        `git show --date=short --pretty=format:%cd`.split("\n")[0].strip
      end
    end     
  end
end