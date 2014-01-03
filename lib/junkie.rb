require "junkie/version"
require 'jenkins_api_client'

module Junkie
  class Client
    def initialize(host, uname = nil, pass = nil)
      @client = JenkinsApi::Client.new(:server_url => host, :username => uname, :password => pass)
    end

    def list(view_name)
      jobs = @client.view.list_jobs(view_name)
      #jobs.each do |job|
      #  job_xml = @client.job.get_config(job)
      #
      #end
      jobs
    end
  end


end
