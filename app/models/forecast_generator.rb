class ForecastGenerator

  def initialize(filter = {})
    @location = filter[:location]
  end

  def fetch_forecast_data
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
    @coordinates ||= google_service.get_coordinates(@location)
  end
end
