class Forecast
  attr_reader :current_temperature,
              :high_temperature,
              :low_temperature,
              :current_description,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :day_description,
              :night_description

  def initialize(filter = {})
    @current_temperature  = filter[:current_temperature]
    @high_temperature     = filter[:high_temperature]
    @low_temperature      = filter[:low_temperature]
    @current_description  = filter[:current_description]
    @feels_like           = filter[:feels_like]
    @humidity             = filter[:humidity]
    @visibility           = filter[:visibility]
    @uv_index             = filter[:uv_index]
    @day_description      = filter[:day_description]
    @night_description    = filter[:night_description]
  end

end
