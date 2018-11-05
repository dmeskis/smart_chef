class DarkskyService

  def initialize(filter = {})
    @filter = filter
  end

  def weather_data
    @weather_data ||= JSON.parse(conn.get("/forecast/#{ENV["DARKSKY_API_KEY"]}/#{lat},#{lng}").body)
  end

  private

    def conn
      Faraday.new(url: "https://api.darksky.net") do |f|
        f.headers['Content-Type'] = 'application/json'
        f.headers['Accept'] = 'application/json'
        f.adapter Faraday.default_adapter
      end
    end

    def lat
      @filter[:lat]
    end

    def lng
      @filter[:lng]
    end

end
