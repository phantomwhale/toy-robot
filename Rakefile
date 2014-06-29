require 'rake'
require 'rspec/core/rake_task'
 
require 'cucumber'
require 'cucumber/rake/task'
 
RSpec::Core::RakeTask.new(:spec) 

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty -x"
  t.fork = false
end

task :default  => :spec
