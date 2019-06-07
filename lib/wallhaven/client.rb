require 'httparty'

module Wallhaven
  class Client
    include HTTParty
    base_uri 'https://wallhaven.cc/api/v1/'

    attr_accessor :api_key

    def initialize(api_key: nil)
      @api_key = api_key
    end
  end
end
