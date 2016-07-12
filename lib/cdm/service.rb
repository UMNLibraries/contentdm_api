module Cdm
  class Service
    attr_reader :format, :function, :params

    def initialize(function: 'wsAPIDescribe', params: [], format: 'json')
      @format   = format
      @function = function
      @params   = params
    end

    def url_params
      "#{function}/#{all_params.join('/')}"
    end

    private

    def all_params
      params.concat([format])
    end
  end
end