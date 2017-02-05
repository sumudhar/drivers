class Driver < ApplicationRecord
  has_one :location , inverse_of: :driver

  accepts_nested_attributes_for :location #,reject_if: proc() { | attrs | attrs['latitude'] .blank? }

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone ,presence:true

  validates_associated :location

  #scope get_distance_from_location  -> (long,lat){Location.distance(long,lat)}

  def name
    self.first_name + self.last_name
  end

   def self.get_details(driver)
     radius = driver['radius'].nil?? 500 : driver['radius']
     no_of_records = driver['limit'].nil? ? 10 : driver['limit']
     latitude,longitude = driver['latitude'],driver['longitude']
     locations= Location.distance(longitude,latitude)
     binding.pry
     puts locations.size
     driver_ids= locations.map{|x| x[:driver_id] if x[:distance]<= radius}.compact
     drivers= Driver.where(id: driver_ids).limit(no_of_records)
   end

 private

end
