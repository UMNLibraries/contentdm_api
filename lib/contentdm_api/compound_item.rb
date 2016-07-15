module CONTENTdmAPI
  # A convenience method to retrive a Ruby hash of Item data from the CONTENTdm
  # API
  class CompoundItem
    attr_reader :collection, :id, :requester, :base_url, :response

    # @param [String] base_url URL to the CONTENTdm API
    #  "http://CdmServer.com:port/dmwebservices/index.php"
    # @param [String] collection The CONTENTdm API calls this an "alias"
    # @param [Integer] id The CONTENTdm API calls this a "pointer". It is the
    #   identifier for a a given CONTENTdm item.
    # @param [Object] requester A class to make requests of the API.
    # @param [Object] response A class to parse API responses.
    #
    # @return [Void]
    def initialize(base_url: '',
                   collection: '',
                   id: 0,
                   requester: RequestBatch,
                   response: Response)
      @collection = collection
      @id         = id
      @requester  = requester
      @base_url   = base_url
      @response   = response
    end

    # A hash of metadata with compound data for a given item
    #
    # @return [Hash] Merged responses from the dmGetItemInfo and
    # dmGetCompoundObjectInfo functions
    def metadata
      values.first.merge(values.last).merge('id' => "#{collection}/#{id}")
    end

    private

    def remove_errors(value)
      (value['code'] != '-2') ? value : {}
    end

    def values
      responses.map { |resp| remove_errors(parse(resp[:value])) }
    end

    def parse(value)
      response.new(raw_data: value).parsed
    end

    def responses
      requester.new(base_url: base_url, service_configs: service_configs).fetch
    end

    def service_configs
      [
        { function: 'dmGetItemInfo', params: [collection, id] },
        { function: 'dmGetCompoundObjectInfo', params: [collection, id] }
      ]
    end
  end
end
