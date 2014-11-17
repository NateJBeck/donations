class Charity < ActiveRecord::Base
  belongs_to :user

  has_many :pickup_dates
  has_many :towns
  has_many :availabilities
end
