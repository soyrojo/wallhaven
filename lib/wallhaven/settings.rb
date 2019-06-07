module Wallhaven
  class Settings

    def self.get(id)
      Client.get('/settings/')["data"]
    end
  end
end
