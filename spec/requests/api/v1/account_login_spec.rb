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
