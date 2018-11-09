require 'rails_helper'

describe 'favoriting locations API' do
  xit 'allows user to favorite a location' do
    user = create(:user)
    post "/api/v1/favorites?location=Denver,+CO&api_key=#{user.api_key}"
    expect(response).to be_successful

  end
  it 'does not allow a user to favorite a location with an invalid api key' do
    user = create(:user)
    post "/api/v1/favorites?location=Denver,+CO&api_key=NotARealApiKey"
    expect(response).to have_http_status(401)
  end
end


# As a user,
# when i send the following post request,
# the following location is added to user favorites,
# an API key must be present,
# if no api key is present it returns a 401 (unauthorized) status
#
# POST /api/v1/favorites
# Content-Type: application/json
# Accept: application/json
#
# body:
#
# {
# "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
# "api_key": "jgn983hy48thw9begh98h4539h4"
# }
