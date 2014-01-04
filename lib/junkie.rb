require "junkie/version"
require 'jenkins_api_client'

module Junkie
  class Client
    def initialize(host, uname = nil, pass = nil)
      @client = JenkinsApi::Client.new(:server_url => host, :username => uname, :password => pass)
    end

    def list(view_name)
      urls = []
      jobs = @client.view.list_jobs(view_name)
      jobs.each do |job|
        job_xml = @client.job.get_config(job)
        doc = Nokogiri::XML(job_xml)
        urls << doc.xpath('project//scm//userRemoteConfigs//hudson.plugins.git.UserRemoteConfig//url').first.content
      end
      urls
    end
  end


end
