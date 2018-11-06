class DarkskyService

  def weather_data(coordinates = {})
    @weather_data ||= get_json("/forecast/#{ENV["DARKSKY_API_KEY"]}/#{coordinates[:lat]},#{coordinates[:lng]}")
  end

  private

    def conn
      Faraday.new(url: "https://api.darksky.net") do |f|
        f.headers['Content-Type'] = 'application/json'
        f.headers['Accept'] = 'application/json'
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end

end
