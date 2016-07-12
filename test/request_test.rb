require 'test_helper'

module Contentdm
  describe Request do
    it "produces a default set of url params" do
      service = Service.new(function: 'FindStuff', params: ['big_and_tall_collection', 1])
      request = Contentdm::Request.new(base_url: 'https://example.com', service: service)
      request.url.must_equal 'https://example.com?q=FindStuff/big_and_tall_collection/1/json'
    end

    describe "when a service with no arguments has been called from a request" do
      it "returns the version of the API by default" do
        request = Contentdm::Request.new(base_url: "https://server16022.contentdm.oclc.org/dmwebservices/index.php")
        VCR.use_cassette("default_request") do
          response = request.fetch
          response.must_equal '{"version":"0.6"}'
        end
      end
    end
  end
end