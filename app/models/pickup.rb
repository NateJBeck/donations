class Pickup < ActiveRecord::Base
  validates :address, presence: true
  validates :town_id, presence: true
  validates :telephone, presence: true

  belongs_to :user
  belongs_to :availability
  belongs_to :charity

  has_one :donor

  def self.confirmed
    where(confirmed: true)
  end

  def self.unconfirmed
    where(confirmed: false)
  end
end
