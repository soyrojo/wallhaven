module Wallhaven
  class Search < Client

    def self.get
      Client.get('/search/', { query: { apikey: @@api_key }})
    end
  end
end
