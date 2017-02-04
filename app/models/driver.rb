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


end
