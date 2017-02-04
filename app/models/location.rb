class Location < ApplicationRecord
  belongs_to :driver , inverse_of: :location

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :accuracy,presence: true
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180,  less_than_or_equal_to: 180 }


end
