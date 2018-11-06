require 'rails_helper'

describe 'account creation API' do
  it 'allows user to create an account with a post request' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    expect(response).to be_successful
    expect(response.body.keys).to contain_exactly('api_key')
  end
  it 'does not allow a user to create an account with an existing email' do
    user = create(:user)

    post "/api/v1/users?email=#{user.email}&password=#{user.password}&password_confirmation=#{user.password}"
    expect(response).to have_http_status(400)
  end
end


# As a user, when I make the below post request, I receive the following response.
#
# POST /api/v1/users
# Content-Type: application/json
# Accept: application/json
#
# {
# "email": "whatever@example.com",
# "password": "password"
# "password_confirmation": "password"
# }
#
# RESPONSE
#
# status: 201
# body:
#
# {
# "api_key": "jgn983hy48thw9begh98h4539h4",
# }
