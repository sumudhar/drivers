class Location < ApplicationRecord
  belongs_to :driver , inverse_of: :location

  validates :longitude, presence: true
  validates :latitude, presence: true
  #validates :driver_id ,presence: true
  validates :accuracy,presence: true



end
