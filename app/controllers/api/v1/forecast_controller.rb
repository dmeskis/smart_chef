class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastGenerator.new(forecast_params).generate
    serialized = ForecastSerializer.new(forecast).serialized_json
    render json: serialized
  end

  private

    def forecast_params
      params.permit(:location)
    end
end
