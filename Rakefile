require 'cucumber/rake/task'
require File.dirname(__FILE__) + '/lib/send_test_report'

include Report

task :default => :full_features

desc "send test report"
task :SendTestReport do
  sendReport if isAnyFailed
end


desc "clear previous test reporta"
task :clearReport do
  clearReport
end


desc "full features"
task :full_features => :clearReport do
  begin
    Rake::Task["cucumber_full_features"].invoke
  ensure
    Rake::Task["SendTestReport"].invoke
  end
end

desc "smoke test"
task :smoke_test => :clearReport do
  begin
    Rake::Task["cucumber_smoke_test"].invoke
  ensure
    Rake::Task["SendTestReport"].invoke
  end
end


desc "cucumber_full_features"
Cucumber::Rake::Task.new("cucumber_full_features") do |t|
  t.profile = 'full_features'
end

desc "cucumber_smoke_test"
Cucumber::Rake::Task.new("cucumber_smoke_test") do |t|
  t.profile = 'smoke_test'
end


