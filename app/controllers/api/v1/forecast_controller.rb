class Api::V1::ForecastController < ApplicationController
  def index
    conn = Faraday.new(url: "https://maps.googleapis.com") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Accept'] = 'application/json'
      f.adapter Faraday.default_adapter
    end
    # payload = {
    #   "address": params[:location]
    # }
    response = conn.get("/maps/api/geocode/json?address=#{params[:location]}&key=#{ENV["GOOGLE_API_KEY"]}")
    parsed_response = JSON.parse(response.body)
    lat = parsed_response["results"][0]["geometry"]["location"]["lat"]
    lon = parsed_response["results"][0]["geometry"]["location"]["lng"]

    darksky_conn = Faraday.new(url: "https://api.darksky.net") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Accept'] = 'application/json'
      f.adapter Faraday.default_adapter
    end

    response = darksky_conn.get("/forecast/#{ENV["DARKSKY_API_KEY"]}/#{lat},#{lon}")
    parsed_response = JSON.parse(response.body)
    temp = parsed_response["currently"]["temperature"]
    high_temp = parsed_response["daily"]["data"][0]["temperatureHigh"]
    low_temp = parsed_response["daily"]["data"][0]["temperatureLow"]
    render json: {
      "current_temperature" => temp,
      "high_temp" => high_temp,
      "low_temp" => low_temp
    }
    # /maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY"
  end
end
