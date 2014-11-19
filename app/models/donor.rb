class Donor < ActiveRecord::Base
  validates :email, presence: true
  validates :pickup_id, presence: true

  has_many :pickups
end
