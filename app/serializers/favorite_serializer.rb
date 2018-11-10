class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attribute :location do |object|
    "#{object.city.name}, #{object.city.state}"
  end

  attribute :current_weather do |object|
    Forecasts.new(object.city).generate
  end
end
