class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastGenerator.new(forecast_params).generate
    render json: forecast
  end

  private

    def forecast_params
      params.permit(:location)
    end
end
