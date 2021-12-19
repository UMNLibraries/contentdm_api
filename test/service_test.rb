require 'test_helper'

describe CONTENTdmAPI::Service do
  describe 'when no arguments have been passed' do
    it 'produces a default set of url params' do
      _(CONTENTdmAPI::Service.new.url_params).must_equal 'wsAPIDescribe/json'
    end
  end

  describe 'when arguments have been passed' do
    it 'produces a corresponding set of url params' do
      service = CONTENTdmAPI::Service.new(function: 'wsASAPAPI', params: [1,2])
      _(service.url_params).must_equal 'wsASAPAPI/1/2/json'
    end
  end
end
