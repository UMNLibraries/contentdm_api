module Contentdm
  class Response
    attr_accessor :raw_data
    def initialize(raw_data: '')
      @raw_data = raw_data
    end

    # Currently only supports json
    def parsed
      JSON.parse(raw_data)
    rescue => e
      # The contentdm api spits out HTML when it can't find a collection
      {"code" => '-2', "message" => "#{e}"}
    end
  end
end