require "bundler/gem_tasks"

require 'rake/extensiontask'
Rake::ExtensionTask.new do |ext|
  ext.name    = 'large_file_linux'
  ext.ext_dir = 'ext/large_file_linux'
  ext.lib_dir = 'lib/large_file_linux'
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec => :compile)

task :default => :spec
