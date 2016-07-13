module Contentdm
  # A class to tell the Request class which function, params and format to
  # request of the CONTENTdm API
  class Service
    attr_reader :format, :function, :params

    # @param [String] function function A CONTENTdm function
    # @param [Array] params A set of params for a given function. Parameters
    #   must be passed as an array in the order specified in the CONTENTdm API
    #   documentation.
    #  "http://CdmServer.com:port/dmwebservices/index.php"
    # @param [String] format Either XML or JSON. Defaults to JSON.
    #
    # @return [Void]
    def initialize(function: 'wsAPIDescribe', params: [], format: 'json')
      @format   = format
      @function = function
      @params   = params
    end

    # URL params for a given service
    #
    # @return [String] A CONTENTdm formatted url parameter string
    def url_params
      "#{function}/#{all_params.join('/')}"
    end

    private

    def all_params
      params.concat([format])
    end
  end
end
