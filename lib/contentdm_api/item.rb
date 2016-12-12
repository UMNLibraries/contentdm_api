module CONTENTdmAPI
  # A convenience method to retrive a Ruby hash of Item data from the CONTENTdm
  # API along with an optional call to fetch Compound Object Info
  class Item
    attr_reader :collection,
                :id,
                :requester,
                :base_url,
                :response,
                :with_compound,
                :page

    # @param [String] base_url URL to the CONTENTdm API
    #  "http://CdmServer.com:port/dmwebservices/index.php"
    # @param [String] collection The CONTENTdm API calls this an "alias"
    # @param [Integer] id The CONTENTdm API calls this a "pointer". It is the
    #   identifier for a a given CONTENTdm item.
    # @param [Boolean] with_compound Include compound object info?
    # @param [Boolean] enrich_compount Fetch and merge full item info for each
    # compound?
    # @param [Object] requester A class to make requests of the API.
    # @param [Object] response A class to parse API responses.
    #
    # @return [Void]
    def initialize(base_url: '',
                   collection: '',
                   id: 0,
                   with_compound: true,
                   requester: RequestBatch,
                   response: Response)
      @collection       = collection
      @id               = id
      @with_compound    = with_compound
      @requester        = requester
      @base_url         = base_url
      @response         = response
    end

    # A hash of item metadata with optional compound data for the given item
    #
    # @return [Hash] Merged responses from the dmGetItemInfo and
    # dmGetCompoundObjectInfo functions
    def metadata
      result.merge('id' => "#{collection}/#{id}")
        .merge('page' => compounds(page))
    end

    private

    def page
      result.fetch('page', [])
    end

    def result
      return if values.first == {} && values.last == {}
      if values.length > 1
        values.first.merge('page' => values.last['page'])
      else
        values.first
      end
    end

    def compounds(page)
      return [] unless with_compound
      raise "====================================#{values.inspect}" if page == nil
      page.map do |compound|
        return {} unless compound.is_a?(Hash)
        compound.merge(self.class.new(base_url: base_url,
                                      collection: collection,
                                      id: compound['pageptr'],
                                      with_compound: false).metadata)
      end
    end

    def remove_errors(value)
      value['code'] != '-2' ? value : {}
    end

    def values
      @values ||= responses.map { |resp| remove_errors(parse(resp[:value])) }
    end

    def parse(value)
      response.new(raw_data: value).parsed
    end

    def responses
      requester.new(base_url: base_url, service_configs: service_configs).fetch
    end

    def service_configs
      with_compound ? item_config.concat(compound_config) : item_config
    end

    def item_config
      [{ function: 'dmGetItemInfo', params: [collection, id] }]
    end

    def compound_config
      [{ function: 'dmGetCompoundObjectInfo', params: [collection, id] }]
    end
  end
end
