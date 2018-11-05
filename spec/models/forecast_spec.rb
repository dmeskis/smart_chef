require 'rails_helper'

describe Forecast, type: :model do
  describe 'attributes' do
    it {should have_a(:current_temperature)}
    it {should have_a(:high_temperature)}
    it {should have_a(:low_temperature)}
    it {should have_a(:current_description)}
    it {should have_a(:feels_like)}
    it {should have_a(:humidity)}
    it {should have_a(:visibility)}
    it {should have_a(:uv_index)}
    it {should have_a(:day_description)}
    it {should have_a(:night_description)}
  end
end
