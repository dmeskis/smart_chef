class DarkskyService

  def initialize(filter = {})
    @filter = filter
  end

  def weather_data
    @weather_data ||= get_json("/forecast/#{ENV["DARKSKY_API_KEY"]}/#{lat},#{lng}")
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

    def lat
      @filter[:lat]
    end

    def lng
      @filter[:lng]
    end

end
