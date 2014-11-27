class Charity < ActiveRecord::Base
  belongs_to :user
  has_many :availabilities, dependent: :destroy
  has_many :pickups, through: :availabilities

  has_many :presences, dependent: :destroy
  has_many :towns, through: :presences

  def tomorrows_availabilities
    availabilities.where(date: Date.tomorrow)
  end

  def upcoming_availabilities
    availabilities.where(date: [Date.tomorrow .. Date.current+7]).
      group_by(&:date)
  end

  def availability_calendar
    availabilities.group_by(&:date)
  end
end
