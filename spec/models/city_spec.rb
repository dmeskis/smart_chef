require 'rails_helper'

RSpec.describe City, type: :model do
  it { should validate_presence_of :name}
  it { should validate_presence_of :state}
  it { should validate_presence_of :latitude}
  it { should validate_presence_of :longitude}
end
