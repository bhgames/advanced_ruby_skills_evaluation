# include config in load path
$:<< File.join(File.dirname(__FILE__), 'config')

Bundler.require

require 'application'
require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
