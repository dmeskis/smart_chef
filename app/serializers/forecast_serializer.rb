class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city,
             :state,
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
  set_id :time
end
