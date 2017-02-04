class Location < ApplicationRecord
  belongs_to :driver

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :driver_id ,presence:true

end
