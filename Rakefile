require "bundler/gem_tasks"

desc 'Runs all testcases'
task :test do
  require File.realpath('lib/zfben_extend.rb')
  require 'test/unit'
  Dir['test/*_test.rb'].each{ |f| require File.realpath(f) }
end
