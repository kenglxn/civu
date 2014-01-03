require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :test
task :test => [:start_jenkins, :spec, :stop_jenkins]

pidfile = 'jenkins/pidfile'

task :start_jenkins => :stop_jenkins do
  jenkins_pid = spawn 'java -DJENKINS_HOME=./jenkins/home -jar jenkins/jenkins.war'
  File.open(pidfile, 'w') { |f| f.write(jenkins_pid) }
  puts "[JUNKIE] Jenkins starting... pid=#{jenkins_pid}"
  sleep 33
  puts "[JUNKIE] Jenkins should be up by now, pid=#{jenkins_pid}"
end

task :stop_jenkins do
  jenkins_pid = IO.read(pidfile) if File.exist?(pidfile)
  `kill -9 #{jenkins_pid}` if jenkins_pid
end



