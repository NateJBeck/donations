class Charity < ActiveRecord::Base
  belongs_to :user
  has_many :availabilities
  has_many :pickups, through: :availabilities

  has_many :presences
  has_many :towns, through: :presences
end
