module Wallhaven
  class Wallpaper < Client

    def self.get(id)
      Client.get('/w/' + id.to_s, { query: { apikey: @@api_key }})
    end
  end
end
