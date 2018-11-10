class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password
  before_create :create_api_key
  has_many :favorites
  has_many :cities, through: :favorites, dependent: :delete_all

  private

  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
