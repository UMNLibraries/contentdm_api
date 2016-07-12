require "cdm/version"
require 'net/http'
require 'json'

# I hate this
# TODO: Refactor
module Cdm
  # Combines itemInfo, compoundInfo and image data from a contentdm API endpoint
  # into a single response.
  # Expects to recive an array of identifiers from an OAI extractor and
  # performs lookups against a contentdm api.
  class Extractor
    attr_reader :api_url, :assets_url, :rest_client, :new_state
    def initialize(args: {}, state: {}, rest_client: Net::HTTP)
      @api_url        = args[:api_url]
      @assets_url     = args[:assets_url]
      @rest_client    = rest_client
      @new_state      = state.dup
    end

    def state
      new_state.merge(data: build_each_record)
    end

    def item_api_request(verb, collection, id)
      request("#{api_url}?q=#{verb}/#{collection}/#{id}/json")
    end

    def build_record(oai_record)
      collection, id = extract_identifiers(oai_record)
      item = Contentdm::CompoundItem.new(api_url, assets_url, collection, id)
      if item.exists?
        item.to_h
      else
        Contentdm::SingleItem.new(api_url, assets_url, collection, id).to_h
      end
    end

    private

    def extract_identifiers(oai_record)
      ids         = oai_record.fetch(:identifiers)
      collection  = ids[:collection]
      id          = ids[:identifier].to_i
      [collection, id]
    end

    def build_each_record
      available_records.map do |oai_record|
        build_record(oai_record)
      end
    end

    def available_records
      new_state.fetch(:data, []).select { |result| result[:deleted] != true }
    end
  end
end

module Contentdm
  # Base class for Contentdm results. Not used directly. Use SingleItem
  # CompoundItem instead
  class Item
    attr_accessor :api_url, :assets_url, :collection, :id, :rest_client, :info
    def initialize(api_url, assets_url, collection, id, rest_client: Net::HTTP)
      @api_url     = api_url
      @assets_url  = assets_url
      @collection  = collection
      @id          = id
      @rest_client = rest_client
    end

    def info
      @info ||= process_response api_request('dmGetItemInfo')
    end

    def to_h
      info.merge!(id: "#{collection}:#{id}")
    end

    def process_response(response)
      JSON.parse(catch_errors(response))
    end

    def assets(id)
      cdm_assets = Asset.new(assets_url, collection, id)
      {
        scalable_image_uri: cdm_assets.scalable_image,
        original_file_uri: cdm_assets.original_file
      }
    end

    def api_request(verb)
      request("#{api_url}?q=#{verb}/#{collection}/#{id}/json")
    end

    def request(location)
      rest_client.get_response(URI(location)).body
    end

    def exists?
      info.fetch('code', '') != '-2'
    end

    def catch_errors(response)
      info_error?(response) ? '{"code": "-2"}' : response
    end

    def info_error?(response_body)
      response_body.include? 'Error looking up collection'
    end
  end
  # A contentdm record along with its info and its assets
  class SingleItem < Item
    def to_h
      if exists?
        super # Must call after exists, probably there is a better way
        info.merge!(assets(id)).merge(record_type: 'single')
      else
        missing_record
      end
    end

    def missing_record
      { status: 'Record Missing', collection: collection, id: id }
    end
  end
  # A contentdm record along with its info and its assets and its compound info
  class CompoundItem < Item
    def exists?
      compound_info.fetch('code', 1) != '-2'
    end

    def compound_info
      @compound_info ||= JSON.parse api_request('dmGetCompoundObjectInfo')
    end

    def to_h
      super
      pages = compound_info.fetch('page', [])
      # When there is only one page, contentdm returns a hash
      pages = pages.is_a?(Hash) ? [pages] : pages
      pages.map! { |page| page.merge(assets(page['pageptr'])) }
      info.merge(compound_objects: pages, record_type: 'compound')
    end
  end
  # A single place to get assets from the contentdm api
  class Asset
    attr_reader :assets_url, :collection, :id
    def initialize(assets_url, collection, id)
      @assets_url = assets_url
      @collection = collection
      @id         = id
    end

    def original_file
      "#{assets_url}/utils/getfile/collection/" \
      "#{collection}/id/#{id}/filename/" \
      "#{collection}-#{id}"
    end

    def scalable_image
      "#{assets_url}/utils/ajaxhelper/" \
      "?CISOROOT=#{collection}"  \
      "&CISOPTR=#{id}"  \
      '&action=2'
    end
  end
end

