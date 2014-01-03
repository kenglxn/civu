require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :test
task :test => [:start_jenkins, :spec, :stop_jenkins]

task :start_jenkins => :stop_jenkins do
  jenkins_pid = spawn 'java -DJENKINS_HOME=./jenkins/home -jar jenkins/jenkins.war'
  IO.write('jenkins/pidfile', jenkins_pid)
  puts "Jenkins starting... pid=#{jenkins_pid}"
  sleep 33
  puts "Jenkins should be up by now, pid=#{jenkins_pid}"
end

task :stop_jenkins do
  jenkins_pid = IO.read('jenkins/pidfile')
  `kill -9 #{jenkins_pid}` if jenkins_pid
end



