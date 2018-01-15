# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

task default: :test

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.warning = false
end
task t: :test

desc 'Start a console session'
task :console do
  sh 'ruby bin/console'
end
task c: :console

desc 'Start a server to test Writedown in a browser'
task :server do
  sh 'ruby test/app/app.rb'
end
task s: :server

desc 'Check dependencies'
task :bundle do
  sh 'bundle --quiet'
end
