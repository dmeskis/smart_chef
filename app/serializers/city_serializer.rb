class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attribute :location do |object|
    "#{object.name}, #{object.state}"
  end

  attribute :current_weather do |object|
    Forecasts.new(object).generate
  end
end
