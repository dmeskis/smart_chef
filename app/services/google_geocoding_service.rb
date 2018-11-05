class GoogleGeocodingService

  def get_location_data(address)
    @location_data ||= conn.get("/maps/api/geocode/json?address=#{address}&key=#{ENV["GOOGLE_API_KEY"]}").body
  end

  def get_coordinates(address)
    data = JSON.parse(get_location_data(address))
    {
      lat: data["results"][0]["geometry"]["location"]["lat"],
      lng: data["results"][0]["geometry"]["location"]["lng"]
    }
  end

  private

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Accept'] = 'application/json'
      f.adapter Faraday.default_adapter
    end
  end

end