require 'rails_helper'

describe 'Weather API' do
  it 'includes the current temperature and high and low temperature for the day' do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    weather_data = JSON.parse(response.body)
    expect(weather_data.keys).to contain_exactly('data')
    expect(weather_data["data"].keys).to contain_exactly('id',
                                                         'type',
                                                         'attributes'
                                                        )
    expect(weather_data["data"]["attributes"].keys).to contain_exactly(
                                                 'current_temperature',
                                                 'high_temperature',
                                                 'low_temperature',
                                                 'current_description',
                                                 'feels_like',
                                                 'humidity',
                                                 'visibility',
                                                 'uv_index',
                                                 'day_description',
                                                 'night_description',
                                                 'weekly_forecast'
                                                 )
  end
end

# As a user,
# when i sent a get request to the below endpoint,
# I should get a forecast for the week,
# including a range of temperatures for the day by the hour,
# a breakdown of the next 5-7 days including the following for each day:
# condition (e.g. sunny, party cloudy, etc),
# humidity (in percent),
# a high temperature (degrees),
# a low temp (degrees)
#
# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json

# As a user,
# when I send a get request to the below endpoint,
# the JSON response should include details of the weather,
# including a description of the weather,
# feels like (in degrees),
# humidity (in percent),
# visibility (in miles),
# UV Index (e.g. 2 (low)),
# A description of today,
# and a description of tonight
#
# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json



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
