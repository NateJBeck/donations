class PickupDate < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true

  belongs_to :charity
end
