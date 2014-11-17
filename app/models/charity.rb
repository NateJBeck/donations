class Charity < ActiveRecord::Base
  belongs_to :user

  has_many :pickup_dates
end
