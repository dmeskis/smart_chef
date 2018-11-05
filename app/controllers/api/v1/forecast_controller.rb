class Api::V1::ForecastController < ApplicationController
  def index
    service = GoogleGeocodingService.new
    coordinates = service.get_coordinates(params[:location])

    # darksky_service = DarkskyService.new(coordinates)
    darksky_service = DarkskyService.new
    weather_data = darksky_service.weather_data(coordinates)
    temp = weather_data[:currently][:temperature]
    high_temp = weather_data[:daily][:data][0][:temperatureHigh]
    low_temp = weather_data[:daily][:data][0][:temperatureLow]
    current_description = weather_data[:currently][:summary]
    feels_like = weather_data[:currently][:apparentTemperature]
    humidity = weather_data[:currently][:humidity]
    visibility = weather_data[:currently][:visibility]
    uv_index = weather_data[:currently][:uvIndex]
    day_description = weather_data[:hourly][:summary]
    night_description = weather_data[:daily][:summary]
    weekly_forecast = weather_data[:daily][:data]


    render json: {
      "current_temperature" => temp,
      "high_temp" => high_temp,
      "low_temp" => low_temp,
      "current_description" => current_description,
      "feels_like" => feels_like,
      "humidity" => humidity,
      "visibility" => visibility,
      "uv_index" => uv_index,
      "day_description" => day_description,
      "night_description" => night_description,
      "weekly_forecast" => weekly_forecast
    }
  end
end
