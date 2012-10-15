namespace :versioner do
  desc "Get the app version number"
  task :version => :environment do
    Versioner.version
  end
end
