class Api::V1::ForecastController < ApplicationController
  before_action :parse_location

  def index
    @city = City.where('name ILIKE :name AND state ILIKE :state', name: "%#{@name.join(' ')}%", state: "%#{@state}%").first_or_create(name: @name, state: @state)
    forecasts = Forecasts.new(@city).generate
    serialized = ForecastSerializer.new(forecasts).serialized_json
    render json: serialized
  end

  private

    def forecast_params
      params.permit(:location)
    end

    def parse_location
      parsed = forecast_params[:location].gsub(/(?!-)\W/, ' ').split
      @name = parsed[0..-2]
      @state = parsed[-1]
    end
end
