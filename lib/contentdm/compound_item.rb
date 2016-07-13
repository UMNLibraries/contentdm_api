module Contentdm
  class CompoundItem
    attr_reader :collection, :id, :requester, :base_url, :response


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
      requester.new(base_url: base_url, services: services).fetch
    end

    def services
      [
        {function: 'dmGetItemInfo', params: [collection, id]},
        {function: 'dmGetCompoundObjectInfo', params: [collection, id]}
      ]
    end
  end
end