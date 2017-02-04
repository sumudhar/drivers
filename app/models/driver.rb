class Driver < ApplicationRecord
  has_many :locations

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone ,presence:true


end
