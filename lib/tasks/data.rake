namespace :data do
  
  task :factories => [:environment, 'db:revert'] do
    prevent_production
    Factory.definition_file_paths = [File.join(RAILS_ROOT, 'features', 'factories')]
    Factory.find_definitions
  end
  
  task :load => ['load:users']
  
  namespace :load do
    
    task :users => :factories do
      5.times do
        user = Factory(:user)
        puts "Creating user: #{user}"
      end
    end
        
  end
end

def prevent_production
  if ENV['RAILS_ENV'] == 'production'
    raise "Cannot load this data into a production environment.  These tasks are meant only as a way to quickly instantiate a test or staging dataset and does destroy ALL data"
  end
end
