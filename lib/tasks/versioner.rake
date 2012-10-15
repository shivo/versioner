namespace :versioner do
  desc "Get the app version number"
  task :version => :environment do
    Versioner.version
  end

  task :increment_major => :environment do
    Versioner.increment_major
  end

  task :increment_minor => :environment do
    Versioner.increment_minor
  end

  task :increment_patch => :environment do
    Versioner.increment_patch
  end

  task :force, :major, :minor, :patch => :environment do |t, args|
    Versioner.force args[:arg1].to_i, args[:arg2].to_i, args[:arg3].to_i
  end
end
