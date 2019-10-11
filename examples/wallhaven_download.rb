require 'wallhaven'
require 'open-uri'
require 'logger'

class WallhavenDownload
  attr_accessor :apikey, :search_params, :logger

  def initialize(**args)
    @apikey        = args.delete(:apikey)
    @search_params = args
    @logger        = Logger.new(STDOUT)
    @logger.level  = Logger::DEBUG

    Wallhaven.apikey = @apikey
    logger.info "#{self.class} started!"
  end

  def download!
    begin
      logger.info "Starting page: #{search_params[:page] || 1 }"

      logger.info "Fetching results"
      results         = Wallhaven.search(search_params)
      path_collection = results.collect{|result| result["path"]}

      logger.info "Starting collection download"
      path_collection.each do |path|
        downloaded = Dir.entries("./downloads")
        filename   = path.split("/")[-1]

        if downloaded.include? filename
          logger.info "-- Already downloaded. Skipping."
          next
        end

        open(path) do |image|
          logger.info "Downloading #{filename}"
          File.open("./downloads/#{filename}", "wb") do |file|
            file.write(image.read)
          end
        end
      end
    rescue => e
      logger.error e.message
    end
  end
end

wd = WallhavenDownload.new(apikey: ENV['WALLHAVEN_APIKEY'], purity: 100, categories: 100, sorting: "toplist")

(1..10).each do |page|
  wd.search_params[:page] = page
  wd.download!
end
