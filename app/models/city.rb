class City < ApplicationRecord
  validates_presence_of :name, :state
  validates_presence_of :latitude, :longitude, on: :save
  before_create :save_coordinates

  def coordinates
    {lat: self.latitude, lng: self.longitude}
  end

  private

  def save_coordinates
    coordinates = google_service.get_coordinates("#{self.name}, #{self.state}")
    self.latitude = coordinates[:lat]
    self.longitude = coordinates[:lng]
  end

  def google_service
    GoogleGeocodingService.new
  end

end
