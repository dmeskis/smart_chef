class Api::V1::FavoritesController < ApplicationController
  def create
    if favorites_params[:api_key]
      user = User.find_by(api_key: favorites_params[:api_key])
      if user != nil
        user.favorites << favorites_params[:location]
        render json: user.favorites
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
end
