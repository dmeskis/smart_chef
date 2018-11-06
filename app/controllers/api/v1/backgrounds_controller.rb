class Api::V1::BackgroundsController < ApplicationController

  def index
    coordinates = GoogleGeocodingService.new.get_coordinates(params[:location])
    response = FlickrService.new.get_background_images(coordinates)
    if response[:stat] == "ok"
      render json: response
    else
      render status: 400
    end
  end

end
