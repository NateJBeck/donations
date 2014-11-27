class Availability < ActiveRecord::Base
  validates :town_id, presence: true
  validates :charity_id, presence: true
  validates :date, presence: true

  belongs_to :charity
  belongs_to :town
  has_many :pickups, dependent: :destroy

  def confirmed_pickups
    pickups.where(confirmed: true)
  end

  def unconfirmed_pickups
    pickups.where(confirmed: false)
  end
end
