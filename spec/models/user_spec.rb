require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email}
  it { should validate_presence_of :password}

  it 'should have an api key on create' do
    user = create(:user)
    expect(user.api_key).to_not eq(nil)
  end
end
