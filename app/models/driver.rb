class Driver < ApplicationRecord
  has_one :location , inverse_of: :driver

  accepts_nested_attributes_for :location #,reject_if: proc() { | attrs | attrs['latitude'] .blank? }

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone ,presence:true

  validates_associated :location


  def name
    self.first_name + self.last_name
  end

   def self.get_details(driver)
     #stores = Store.near([@current_lat, @current_lon], 10, :units => :km)
     radius = driver['radius'].nil?? 500 : driver['radius']
     no_of_records = driver['limit'].nil? ? 10 : driver['limit']
     latitude,longitude = driver['latitude'],driver['longitude']
     location = Location.near([latitude,longitude],radius)
   end

 private



end
