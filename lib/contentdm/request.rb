require 'net/http'

module Contentdm
  # Form requests to the ContentDM API
  class Request
    attr_reader :base_url, :client, :service

    def initialize(base_url: '', client: Net::HTTP, service: Service.new)
      @base_url = base_url
      @client  =  client
      @service  = service
    end

    def fetch
      request
    end

    def url
      "#{base_url}?q=#{service.url_params}"
    end

    private

    def request
      @response ||= client.get_response(URI(url)).body
    end
  end
end
