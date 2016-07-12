require 'test_helper'
require_relative '../lib/cdm/service'

describe Cdm::Service do
  describe 'when no arguments have been passed' do
    it 'produces a default set of url params' do
      Cdm::Service.new.url_params.must_equal 'wsAPIDescribe/json'
    end
  end

  describe 'when arguments have been passed' do
    it 'produces a corresponding set of url params' do
      service = Cdm::Service.new(function: 'wsASAPAPI', params: [1,2])
      service.url_params.must_equal 'wsASAPAPI/1/2/json'
    end
  end
end
