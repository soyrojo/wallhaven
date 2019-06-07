module Wallhaven
  class Wallpaper

    def self.get(id)
      Client.get('/w/' + id.to_s)["data"]
    end
  end
end
