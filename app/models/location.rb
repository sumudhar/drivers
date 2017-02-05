class Location < ApplicationRecord
  belongs_to :driver , inverse_of: :location

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :accuracy,presence: true
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180,  less_than_or_equal_to: 180 }



  def self.distance(long=nil,lat=nil)
    result = []
    self.all.each do |record|
      rad_per_deg = Math::PI/180
      r = 6378.14*1000
      dist_lat = (lat * rad_per_deg)-(record.latitude.to_f* rad_per_deg)
      dist_long = (long * rad_per_deg) -(record.longitude.to_f * rad_per_deg)
      a = Math::sin(dist_lat/2) **2 + Math::cos(lat * rad_per_deg) * Math::cos(record.latitude.to_f* rad_per_deg) * Math::sin(dist_long/2)**2
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
      dist = r * c
      result << {driver_id: record.driver_id, distance: dist}
    end
    result
  end

end
