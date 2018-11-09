class Forecasts

  def initialize(city)
    @city = city
  end

  def fetch_forecast_data
    @data ||= darksky_service.weather_data(@city.coordinates)
  end

  def generate
    Forecast.new(fetch_forecast_data)
  end

  private

  def darksky_service
    DarkskyService.new
  end

end
