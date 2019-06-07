module Wallhaven
  class Tag

    def self.get(id)
      Client.get('/tag/' + id.to_s)["data"]
    end
  end
end
