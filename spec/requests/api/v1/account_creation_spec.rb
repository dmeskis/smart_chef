require 'rails_helper'

describe 'account creation API' do
  it 'allows user to create an account with a post request' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"]["attributes"].keys).to contain_exactly('api_key')
  end
  it 'does not allow a user to create an account with an existing email' do
    user = create(:user)
    email = user.email
    password = user.password

    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
    expect(response).to have_http_status(400)
  end
end
