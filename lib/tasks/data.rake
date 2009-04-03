namespace :data do
  
  task :factories => [:environment, 'db:revert'] do
    prevent_production
    Factory.definition_file_paths = [File.join(RAILS_ROOT, 'features', 'factories')]
    Factory.find_definitions
  end
  
  task :load => :factories do
    account = Factory(:account, :name => 'Test Company')    
    5.times { puts "Creating user: #{Factory(:user, :account => account)}" }
    2.times do
      app = Factory(:application, :account => account)
      puts "Creating app: #{app}"
      20.times { Factory(:statement, :application => app)}
    end    
  end
        
end

def prevent_production
  if ENV['RAILS_ENV'] == 'production'
    raise "Cannot load this data into a production environment.  These tasks are meant only as a way to quickly instantiate a test or staging dataset and does destroy ALL data"
  end
end
