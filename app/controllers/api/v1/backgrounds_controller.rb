class Api::V1::BackgroundsController < ApplicationController

  def index
    conn = Faraday.new(url: "https://api.flickr.com/services/rest") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Accept'] = 'application/json'
      f.adapter Faraday.default_adapter
    end
    lat = 39.7392358
    lon = -104.990251
    response = conn.get("?method=flickr.photos.search&format=json&api_key=#{ENV['FLICKR_API_KEY']}&lat=#{lat}&long=#{lon}&tags=parks&nojsoncallback=1&per_page=25")
    responses = JSON.parse(response.body, symbolize_names: true)
    if responses[:stat] == "ok"
      render json: responses
    else
      render status: 400
    end
  end

end
