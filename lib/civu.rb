require "civu/version"
require 'jenkins_api_client'

module Civu
  class Client
    attr_reader :executor
    def initialize(host, uname = nil, pass = nil, debug = false)
      @client = JenkinsApi::Client.new(
          :server_url => host,
          :username => uname,
          :password => pass,
          :log_level => debug ? Logger::DEBUG : Logger::FATAL
      )
      @executor = Civu::Executor.new
    end

    def list(view_name)
      urls = []
      jobs = @client.view.list_jobs(view_name)
      jobs.each do |job|
        job_xml = @client.job.get_config(job)
        doc = Nokogiri::XML(job_xml)
        url_node = doc.xpath('//scm//userRemoteConfigs//hudson.plugins.git.UserRemoteConfig//url')
        urls << url_node.first.content unless url_node.empty?
      end
      urls.uniq
    end

    def clone(view_name)
      urls = list(view_name)
      urls.each do |url|
        @executor.run("git clone #{url} #{url.partition(':').last}")
      end
    end
  end

  class Executor
    def run(cmd)
      system(cmd)
    end
  end

end
