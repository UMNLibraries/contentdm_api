require 'json'

module Cdm
  # Request multiple services all at once
  # Assumes the response format is JSON
  class RequestBatch
    attr_reader :services, :base_url, :requester
    def initialize(base_url: '', services:[], requester: Request)
      @services  = services
      @base_url  = base_url
      @requester = requester
    end

    def fetch
      responses
    end

    private

    def responses
      services.map { |service| {service: service.function,
                                response: request(service, base_url)} }
    end

    def request(service, base_url)
      JSON.parse(requester.new(service: service, base_url: base_url).fetch)
    end

  end

end