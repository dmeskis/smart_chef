class Api::V1::BackgroundsController < ApplicationController

  def index
    coordinates = GoogleGeocodingService.new.get_coordinates(params[:location])
    response = FlickrService.new.get_background_images(coordinates)
    render json: response
  end

end
