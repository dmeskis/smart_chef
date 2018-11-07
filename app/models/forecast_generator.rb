class ForecastGenerator

  def initialize(filter = {})
    @location = filter[:location]
    parse_location
    @city = city
  end

  def fetch_forecast_data
    # binding.pry
    @data ||= darksky_service.weather_data(coordinates)
  end

  def generate
    Forecast.new(fetch_forecast_data)
  end

  private

  def google_service
    GoogleGeocodingService.new
  end

  def darksky_service
    DarkskyService.new
  end

  def coordinates
    if city.nil?
      # City.create(name: @name, state: @state)
      @coordinates ||= google_service.get_coordinates(@location)
    else
      @coordinates ||= city.coordinates
    end
  end

  def city
    City.find_by('name ILIKE :name AND state ILIKE :state', name: "%#{@name}%", state: "%#{@state}%")
  end

  def parse_location
    parsed = @location.gsub(/\W/, ' ').split
    @name = parsed[0]
    @state = parsed[1]
  end
end
