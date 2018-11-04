require 'rails_helper'

describe 'Weather API' do
  it 'includes the current temperature and high and low temperature for the day' do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    weather_data = JSON.parse(response.body)
    binding.pry
    expect(weather_data["current_temperature"]).to exist
    expect(weather_data["high_temp"]).to exist
    expect(weather_data["low_temp"]).to exist
  end
end

# As a user,
# when i send a GET request to the below endpoint,
# I should send the data from the query to Google's Geocoding API to retrieve the lat and long for the city
#
# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json
#
# As a user,
# when i sent a get request to the below endpoint
# the JSON response should include the current temperature,
# and should have a high and low temperature for the day.
#
# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json
