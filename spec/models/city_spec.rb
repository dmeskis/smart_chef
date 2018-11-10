require 'rails_helper'

RSpec.describe City, type: :model do
  it { should validate_presence_of :name}
  it { should validate_presence_of :state}
  it { should have_many :users }
  it 'should grab the correct coordinates on create' do
    city = City.create!(name: "Denver", state: "Colorado")
    expect(city.latitude).to eq(39.7392358)
    expect(city.longitude).to eq(-104.990251)
  end
  describe 'methods' do
    it 'coordinates' do
      city = City.create!(name: "Denver", state: "Colorado")
      expect(city.coordinates).to eq({lat: 39.7392358,
                                         lng: -104.990251})
    end
    it 'unabbreviate_state' do
      city = City.create!(name: "Denver", state: "Co")
      expect(city.state).to eq("Colorado")
    end
    it 'does not unabbreviate already unabbreviated state' do
      city = City.create!(name: "Denver", state: "Colorado")
      expect(city.state).to eq("Colorado")
    end
  end
end
