require 'rails_helper'

describe 'Background API' do
  it 'fetches an image from an imaging site to use as the background for our forecast page' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    image_data = JSON.parse(response.body)
    expect(image_data.keys).to contain_exactly('photos', 'stat')
  end
end
