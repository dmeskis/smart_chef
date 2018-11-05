class Api::V1::ForecastController < ApplicationController
  def index
    service = GoogleGeocodingService.new
    coordinates = service.get_coordinates(params[:location])
    
    darksky_service = DarkskyService.new(coordinates)
    weather_data = darksky_service.weather_data
    temp = weather_data["currently"]["temperature"]
    high_temp = weather_data["daily"]["data"][0]["temperatureHigh"]
    low_temp = weather_data["daily"]["data"][0]["temperatureLow"]
    render json: {
      "current_temperature" => temp,
      "high_temp" => high_temp,
      "low_temp" => low_temp
    }
    # /maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY"
  end
end
