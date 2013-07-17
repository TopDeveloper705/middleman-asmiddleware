require "bundler/gem_tasks"

require 'rspec'
require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new :spec do |task|
  task.pattern = 'spec/**/*_spec.rb'
end

task default: :spec
