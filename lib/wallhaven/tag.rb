module Wallhaven
  class Tag < Client

    def self.get(id)
      Client.get('/tag/' + id.to_s, { query: { apikey: @@api_key }})
    end
  end
end
