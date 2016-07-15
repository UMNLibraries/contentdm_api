module CONTENTdmAPI
  # Make a batch of requests to the CONTENTdm API and combine them
  class RequestBatch
    attr_reader :service, :configs, :base_url, :requester
    # @param [String] base_url URL to the CONTENTdm API
    #  "http://CdmServer.com:port/dmwebservices/index.php"
    # @param [Array] service_configs An array of hash configurations for
    #   individual services
    #  "http://CdmServer.com:port/dmwebservices/index.php"
    # @param [Object] service A Service class to tell the Request class
    #   which function, params and format to request of the CONTENTdm API
    # @param [Object] requester A class to form requests to the ContentDM API
    #
    # @return [Void]
    def initialize(base_url: '',
                   service_configs: [],
                   service: Service,
                   requester: Request)

      @service   = service
      @configs   = service_configs
      @base_url  = base_url
      @requester = requester
    end

    # Fetch data from the CONTENTdm API
    #
    # @return [Array] an array of hashes containing Request response data
    def fetch
      responses
    end

    private

    def service_objects
      configs.map { |s| new_service(s[:function], s.fetch(:params, [])) }
    end

    def new_service(function, params)
      service.new(function: function, params: params)
    end

    def responses
      service_objects.map do |service|
        { service: service.function, value: request(service, base_url) }
      end
    end

    def request(service, base_url)
      requester.new(service: service, base_url: base_url).fetch
    end
  end
end
