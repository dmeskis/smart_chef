class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_temperature,
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
end
