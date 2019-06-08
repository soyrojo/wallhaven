require 'httparty'

module Wallhaven
  include HTTParty
  base_uri 'https://wallhaven.cc/api/v1/'

  class << self
    attr_accessor :apikey
  end

  def self.wallpaper(id)
    parse get("/w/#{id}", query)
  end

  def self.search(params = {})
    parse get('/search', query(params ))
  end

  def self.tag(id)
    parse get("/tag/#{id}", query)
  end

  def self.settings
    parse get("/settings", query)
  end

  private

  def self.parse(response)
    response.parsed_response["data"]
  end

  def self.query(params = {})
    { query: { apikey: apikey }.merge(params) }
  end
end
