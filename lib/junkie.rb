require "junkie/version"
require 'jenkins_api_client'

module Junkie
  class Client
    def initialize(host, uname, pass)
      @client = JenkinsApi::Client.new(:server_ip => host, :username => uname, :password => pass)
    end
  end


end
