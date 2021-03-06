class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, :validate_user
  before_action :parse_location, only: :create
  before_action :find_or_create_location, only: [:create, :destroy]
  before_action :favorite, only: :create
  skip_before_action :verify_authenticity_token


  def create
    render json: FavoriteSerializer.new(@user.favorites).serialized_json
  end

  def index
    render json: FavoriteSerializer.new(@user.favorites).serialized_json
  end

  def destroy
    favorite = Favorite.find_by(city_id: @city)
    if @user.favorites.delete(favorite)
      Favorite.delete(favorite)
      render json: FavoriteSerializer.new(@user.favorites).serialized_json
    else
      render json: {errors: "City not found"}, status: 401
    end
  end

  private

    def favorites_params
      params.permit(:location, :api_key)
    end

    def find_user
      @user ||= User.find_by(api_key: favorites_params[:api_key])
    end

    def validate_user
      render json: {errors: "User invalid"}, status: 401 if @user.nil?
    end

    def validate_location
      render json: {errors: "Location invalid"}, status: 401 if favorites_params[:location].nil?
    end

    def find_or_create_location
      @city ||= City.where('name ILIKE :name AND state ILIKE :state', name: "%#{@name.join(' ') unless @name == nil}%", state: "%#{@state}%").first_or_create(name: @name, state: @state)
    end

    def favorite
      @user.cities << @city
    end

    def parse_location
      parsed = favorites_params[:location].gsub(/(?!-)\W/, ' ').split
      @name = parsed[0..-2]
      @state = parsed[-1]
    end
end
