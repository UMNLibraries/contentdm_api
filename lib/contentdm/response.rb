module Contentdm
  # A class to parse API responses.
  class Response
    attr_accessor :raw_data
    # @param [String] raw_data A string of data received from the CONTENTdm API
    #
    # @return [Void]
    def initialize(raw_data: '')
      @raw_data = raw_data
    end

    # A parsed JSON string response that handles cases where the API does not
    # return valid JSON (Response only supports JSON responses for now).
    #
    # @return [Hash] A ruby hash of a CONTENTdm response
    def parsed
      JSON.parse(raw_data)
    rescue => e
      # The contentdm api spits out HTML when it can't find a collection
      { 'code' => '-2', 'message' => e.to_s }
    end
  end
end
