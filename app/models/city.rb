class City < ApplicationRecord
  validate_presence_of :name, :state
  before_create :get_coordinates


  private

  def get_coordinates
    service = GoogleGeocodingService.new
    coordinates = service.get_coordinates("#{self.city}, #{self.state}")
    self.latitude = coordinates[:lat]
    self.longitude = coordinates[:lng]
  end
end
