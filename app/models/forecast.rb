class Forecast
  include ActiveModel::Validations
  validates_presence_of :current_temperature,
                        :high_temperature,
                        :low_temperature,
                        :current_description,
                        :feels_like,
                        :humidity,
                        :visibility,
                        :uv_index,
                        :day_description,
                        :night_description,
                        :weekly_forecast

  attr_accessor :city,
                :state,
                :time,
                :current_temperature,
                :high_temperature,
                :low_temperature,
                :current_description,
                :feels_like,
                :humidity,
                :visibility,
                :uv_index,
                :day_description,
                :night_description,
                :hourly_forecast,
                :weekly_forecast

  def initialize(city, forecast_data = {})
    @city                 = city.name
    @state                = city.state
    @time                 = forecast_data[:currently][:time]
    @current_temperature  = forecast_data[:currently][:temperature]
    @high_temperature     = forecast_data[:daily][:data][0][:temperatureHigh]
    @low_temperature      = forecast_data[:daily][:data][0][:temperatureLow]
    @current_description  = forecast_data[:currently][:summary]
    @feels_like           = forecast_data[:currently][:apparentTemperature]
    @humidity             = forecast_data[:currently][:humidity]
    @visibility           = forecast_data[:currently][:visibility]
    @uv_index             = forecast_data[:currently][:uvIndex]
    @day_description      = forecast_data[:hourly][:summary]
    @night_description    = forecast_data[:daily][:summary]
    @hourly_forecast      = forecast_data[:hourly][:data]
    @weekly_forecast      = forecast_data[:daily][:data]
  end

end
