class Charity < ActiveRecord::Base
  belongs_to :user
  has_many :availabilities, dependent: :destroy
  has_many :pickups, through: :availabilities

  has_many :presences, dependent: :destroy
  has_many :towns, through: :presences
end
