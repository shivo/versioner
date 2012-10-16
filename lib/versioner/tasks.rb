namespace :versioner do
  desc "Get the app's version number"
  task :version => :environment do
    Versioner.version
  end

  desc "Increment the major version number by 1"
  task :increment_major => :environment do
    Versioner.increment_major
  end

  desc "Increment the minor version number by 1"
  task :increment_minor => :environment do
    Versioner.increment_minor
  end

  desc "Increment the patch version number by 1"
  task :increment_patch => :environment do
    Versioner.increment_patch
  end

  desc "Force a new version number (required: major, minor, patch)"
  task :force, [:major, :minor, :patch] => :environment do |t, args|
    puts Versioner.force args.major.to_i, args.minor.to_i, args.patch.to_i
  end
end
