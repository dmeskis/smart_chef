require 'rails_helper'

describe Forecast, type: :model do
  describe 'attributes' do
    it {should validate_presence_of(:current_temperature)}
    it {should validate_presence_of(:high_temperature)}
    it {should validate_presence_of(:low_temperature)}
    it {should validate_presence_of(:current_description)}
    it {should validate_presence_of(:feels_like)}
    it {should validate_presence_of(:humidity)}
    it {should validate_presence_of(:visibility)}
    it {should validate_presence_of(:uv_index)}
    it {should validate_presence_of(:day_description)}
    it {should validate_presence_of(:night_description)}
  end
end
