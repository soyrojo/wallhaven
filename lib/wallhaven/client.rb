require 'httparty'

module Wallhaven
  class Client
    include HTTParty
    base_uri 'https://wallhaven.cc/api/v1/'

    attr_accessor :api_token, :params

    def initialize(api_token: nil, *params)
      @api_token = api_token
      @params    = params
    end
  end
end
