namespace :db do
  desc "Drop the dbs, and does a full migrate to bring it back up"
  task :revert => ['db:drop', 'db:create', 'db:migrate']
end
