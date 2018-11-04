require 'spec_helper'

describe GoogleGeocodingService do
  it 'grabs the latitute and longitude of searched fields' do
    service = GoogleGeocodingService.new
    query = "Denver, co"
    coordinates = service.get_coordinates(query)
    expect(coordinates[:lat]).to eq(39.7392358)
    expect(coordinates[:lng]).to eq(-104.990251)
  end
end
