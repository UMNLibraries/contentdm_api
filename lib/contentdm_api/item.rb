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
    # @param [Boolean] with_compound Recursively request and in clude full
    #   compound item data? If false, basic compound data will STILL be
    #   included in the array value of the item hash key 'page'. 'page' is the
    #   term CONTENTdm uses to signify a list of child pages for an item.
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
      if with_compound
        result_with_id.merge('page' => compounds_to_h)
      else
        result_with_id.merge('page' => page)
      end
    end

    def compounds_to_h
      page.map do |compound|
        block_given? ? yield(compound(compound)) : compound(compound)
      end
    end

    private

    def compound(compound)
      # API gives inconsistent results
      return {} unless compound.is_a?(Hash)
      compound.merge(self.class.new(base_url: base_url,
                                    collection: collection,
                                    id: compound['pageptr'],
                                    with_compound: false).metadata)
    end

    def page
      # Single result pages come back as a hash. Cast them into and array to
      # make our api more consistent
      [result.fetch('page', [])].flatten
    end

    def result_with_id
      @result_with_id ||= result.merge('id' => "#{collection}/#{id}")
    end

    def result
      values.first.merge('page' => values.last.fetch('page', []))
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
      item_config.concat(compound_config)
    end

    def item_config
      [{ function: 'dmGetItemInfo', params: [collection, id] }]
    end

    def compound_config
      [{ function: 'dmGetCompoundObjectInfo', params: [collection, id] }]
    end
  end
end
