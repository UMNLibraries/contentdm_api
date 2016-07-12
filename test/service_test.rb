require 'test_helper'
require_relative '../lib/contentdm/service'

describe Contentdm::Service do
  describe 'when no arguments have been passed' do
    it 'produces a default set of url params' do
      Contentdm::Service.new.url_params.must_equal 'wsAPIDescribe/json'
    end
  end

  describe 'when arguments have been passed' do
    it 'produces a corresponding set of url params' do
      service = Contentdm::Service.new(function: 'wsASAPAPI', params: [1,2])
      service.url_params.must_equal 'wsASAPAPI/1/2/json'
    end
  end
end
