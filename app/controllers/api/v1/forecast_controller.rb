class Api::V1::ForecastController < ApplicationController
  def index
    binding.pry
    forecast = ForecastGenerator.new(forecast_params).generate
    serialized = ForecastSerializer.new(forecast).serialized_json
    binding.pry
    render json: forecast
  end

  private

    def forecast_params
      params.permit(:location)
    end
end
