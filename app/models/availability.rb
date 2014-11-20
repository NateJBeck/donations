class Availability < ActiveRecord::Base
  validates :town_id, presence: true
  validates :charity_id, presence: true
  validates :date, presence: true

  belongs_to :charity
  belongs_to :town
  has_many :pickups

  def find_town_from(town_id)
    town = Town.find(town_id)
    town.name
  end

  def find_charity_from(charity_id)
    charity = Charity.find(charity_id)
    charity.name
  end

  def confirmed_pickups
    pickups.where(confirmed: true)
  end

  def unconfirmed_pickups
    pickups.where(confirmed: false)
  end
end
