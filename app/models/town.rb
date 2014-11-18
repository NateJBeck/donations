class Town < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :presences
  has_many :charities, through: :presences
end
