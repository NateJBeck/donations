class Availability < ActiveRecord::Base
  validates :town_id, presence: true
  validates :charity_id, presence: true
  validates :date, presence: true

  belongs_to :charity
  belongs_to :town
  has_many :pickups, dependent: :destroy

  def self.next_six_availabilities(params)
    where(params).order(:date).where("date > ?", Date.current).limit(6)
  end

  def confirmed_pickups
    pickups.confirmed
  end

  def unconfirmed_pickups
    pickups.unconfirmed
  end

  def self.recently_created
    where(created_at: [TEN_HOURS_AGO .. Time.current])
  end

  def self.for_tomorrow
    where(date: Date.tomorrow)
  end

  def self.for_the_week
    where(date: [Date.tomorrow .. Date.current + 7]).
      group_by(&:date).sort_by { |date, _| date }
  end

  def self.for_the_year
    where(date: [Date.current .. Date.current + 365]).
      group_by(&:date).sort_by { |date, _| date }
  end

  def self.confirmed_count
    all.map { |avail| avail.confirmed_pickups.count }.inject(:+)
  end

  def self.next_two_months
    where(date: [Date.current + 1 .. Date.current + 60])
  end
end
