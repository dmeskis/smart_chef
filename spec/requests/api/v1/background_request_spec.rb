require 'rails_helper'

describe 'Background API' do
  it 'fetches an image from an imaging site to use as the background for our forecast page' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    image_data = JSON.parse(response.body)
    binding.pry
  end
end

# As a user,
# when i visit the weather page,
# the background image is randomly pulled from an imaging site using the below endpoint in our app.
#
# The image must be limited to the city being viewed.
#
# APIs to user: Flickr or photos.getInfo
#
# Stretch goal: Write a rake task that caches photos for the 50 largest U.S. cities to improve page load times (Throw this in another user story)
#
# GET /api/v1/backgrounds?location=denver,co
