require "contentdm/version"
require 'net/http'
require 'json'

Dir["./contendm/*.rb"].each {|file| require file }

require_relative './request_batch'
