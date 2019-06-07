module Wallhaven
  class Settings < Client

    def self.get(id)
      Client.get('/settings/', { query: { apikey: @@api_key }})
    end
  end
end
