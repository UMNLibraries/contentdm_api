require 'test_helper'

module CONTENTdmAPI
  describe CONTENTdmAPI::RequestBatch do
    it 'fetches set of services' do
      service_configs = [{function: 'wsAPIDescribe'}, {function: 'dmGetLocale'}]
      requests = CONTENTdmAPI::RequestBatch.new(base_url: "https://server16022.contentdm.oclc.org/dmwebservices/index.php", service_configs: service_configs)
        response = requests.fetch
        response.must_equal [{:service=>"wsAPIDescribe", :value=>"{\"version\":\"0.6\"}"}, {:service=>"dmGetLocale", :value=>"{\"locale\":\"en_US\"}"}]
    end

    describe 'when requested resources do not exist' do
      it 'indicates requested items were not found' do
        service_configs = [{function: 'dmGetItemInfo', params: ['spl', 3249082389234]}, {function: 'dmGetCompoundObjectInfo', params: ['spl', 3249082389234]}]
        requests = CONTENTdmAPI::RequestBatch.new(base_url: "https://server16022.contentdm.oclc.org/dmwebservices/index.php", service_configs: service_configs)
          response = requests.fetch
       response.must_equal [{:service=>"dmGetItemInfo", :value=>"{\"code\":\"-2\",\"message\":\"Requested item not found\",\"restrictionCode\":\"-1\"}"}, {:service=>"dmGetCompoundObjectInfo", :value=>"{\"message\":\"Requested item is not compound\",\"code\":\"-2\"}"}]
      end
    end
  end
end