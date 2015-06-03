require 'data_mapper'
require './lib/datamapper_setup'


task test: [:cop, :spec]

# task default: `bundle exec rackup`

begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new :cop
  RSpec::Core::RakeTask.new :spec
rescue LoadError => e
  puts "Test dependencies could not be loaded"
end

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end

