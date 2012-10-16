module Versioner
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.join('versioner', 'tasks.rb')
    end
  end
end
