require 'json'

module Contentdm
  # Request multiple services all at once
  # Assumes the response format is JSON
  class RequestBatch
    attr_reader :service, :services, :base_url, :requester
    def initialize(base_url: '', services:[], service: Service, requester: Request)
      @service   = service
      @services  = services
      @base_url  = base_url
      @requester = requester
    end

    def fetch
      responses
    end

    private

    def service_objects
      services.map {|s| new_service(s[:function], s.fetch(:params, [])) }
    end

    def new_service(function, params)
      service.new(function: function, params: params)
    end

    def responses
      service_objects.map { |service| {service: service.function,
                                       value: request(service, base_url)} }
    end

    def request(service, base_url)
      JSON.parse(requester.new(service: service, base_url: base_url).fetch)
    end
  end
end
