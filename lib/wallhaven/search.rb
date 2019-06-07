module Wallhaven
  class Search

    def self.get
      Client.get('/search/')["data"]
    end
  end
end
