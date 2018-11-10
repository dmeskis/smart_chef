class Api::V1::FavoritesController < ApplicationController
  before_action :parse_location

  def create
    if favorites_params[:api_key]
      user = User.find_by(api_key: favorites_params[:api_key])
      if user != nil
        user.cities << City.where('name ILIKE :name AND state ILIKE :state', name: "%#{@name}%", state: "%#{@state}%").first_or_create(name: @name, state: @state)
        render json: CitySerializer.new(user.cities).serialized_json
      else
        render json: {errors: "error"}, status: 401
      end
    else
      render json: {errors: "error"}, status: 401
    end
  end

  private

    def favorites_params
      params.permit(:location, :api_key)
    end

    def parse_location
      parsed = favorites_params[:location].gsub(/(?!-)\W/, ' ').split
      @name = parsed[0]
      @state = parsed[1]
    end
end
