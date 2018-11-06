require 'rails_helper'

describe 'account login API' do
  it 'allows user to log into an account with a post request' do
    user = create(:user)
    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"]["attributes"].keys).to contain_exactly('api_key')
  end
  it 'does not allow a user to log into an account with invalid data' do
    user = create(:user)

    post "/api/v1/sessions?email=#{user.email}&password=WRONGPASSWORD"
    expect(response).to have_http_status(400)
  end
end

# As a user, when I send the below post request,
# I receive the following response
#
# POST /api/v1/sessions
# Content-Type: application/json
# Accept: application/json
#
# {
# "email": "whatever@example.com",
# "password": "password"
# }
#
# RESPONSE
#
# status: 200
# body:
#
# {
# "api_key": "jgn983hy48thw9begh98h4539h4",
# }
