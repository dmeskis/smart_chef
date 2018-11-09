class FlickrService

  def get_background_images(coordinates = {})
    @background_data ||= get_json(("?method=flickr.photos.search&format=json&api_key=#{ENV['FLICKR_API_KEY']}&lat=#{coordinates[:lat]}&long=#{coordinates[:lon]}&tags=parks&nojsoncallback=1&per_page=25"))
  end

  private

    def conn
      Faraday.new(url: "https://api.flickr.com/services/rest") do |f|
        f.headers['Content-Type'] = 'application/json'
        f.headers['Accept'] = 'application/json'
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end

end
