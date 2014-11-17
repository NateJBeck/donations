class Town < ActiveRecord::Base
  validates :name, presence: true
  validates :zipcode, presence: true

  belongs_to :charity
end
