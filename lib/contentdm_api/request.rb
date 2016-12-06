require 'net/http'
module CONTENTdmAPI
  # Form requests to the ContentDM API
  class Request
    attr_reader :base_url, :client, :service
    # @param [String] base_url URL to the CONTENTdm API
    #  "http://CdmServer.com:port/dmwebservices/index.php"
    # @param [Object] client An HTTP client to make requests of the API
    # @param [Object] service A class to tell the Request class which function,
    #  params and format to request of the CONTENTdm API
    #
    # @return [Void]
    def initialize(base_url: '', client: Net::HTTP, service: Service.new)
      @base_url = base_url
      @client   = client
      @service  = service
    end

    # Fetch data from the CONTENTdm API
    #
    # @return [String] either XML or JSON
    def fetch
      request.body
    end

    def uri
      @uri = URI.parse(unencoded_url)
    end

    private

    def http
      http = client.new(uri.host, uri.port)
      http.read_timeout = 300
      http.open_timeout = 120
      http.use_ssl = (uri.scheme == "https")
      http
    end

    def request
      http.request(client::Get.new(uri.request_uri))
    end

    # A URL for a given service
    #
    # @return [String] a url string
    def unencoded_url
      "#{base_url}?q=#{service.url_params}"
    end
  end
end
