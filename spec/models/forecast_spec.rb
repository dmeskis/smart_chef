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
    # 
    # it {should have_a(:current_temperature)}
    # it {should have_a(:high_temperature)}
    # it {should have_a(:low_temperature)}
    # it {should have_a(:current_description)}
    # it {should have_a(:feels_like)}
    # it {should have_a(:humidity)}
    # it {should have_a(:visibility)}
    # it {should have_a(:uv_index)}
    # it {should have_a(:day_description)}
    # it {should have_a(:night_description)}
  end
end
