class Pickup < ActiveRecord::Base
  validates :address, presence: true
  validates :town_id, presence: true
  validates :telephone, presence: true

  belongs_to :user
  belongs_to :availability
  has_one :donor
end
