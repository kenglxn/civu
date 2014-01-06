require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :test
task :test => [:start_jenkins, :spec] do
  Rake::Task[:stop_jenkins].execute
end

pidfile = 'jenkins/pidfile'

task :start_jenkins do
  jenkins_pid = spawn 'java -DJENKINS_HOME=./jenkins/home -jar jenkins/jenkins.war'
  File.open(pidfile, 'w+') { |f| f.write(jenkins_pid) }
  puts "[CIVU] Jenkins starting... pid=#{jenkins_pid}"
  sleep 33
  puts "[CIVU] Jenkins should be up by now, pid=#{jenkins_pid}"
end

task :stop_jenkins do
  jenkins_pid = IO.read(pidfile) if File.exist?(pidfile)
  if jenkins_pid.nil? or jenkins_pid.empty?
    puts '[CIVU] No pid found, unable to stop jenkins. Are you sure it is running?'
    puts '[CIVU] If it is in the list below, please kill it manually:'
    exec 'ps ax | grep jenkins'
  else
    puts "[CIVU] Killing pid=#{jenkins_pid}"
    `kill -9 #{jenkins_pid}`
    File.open(pidfile, 'w') { |f| f.write('') }
  end
end

