class Availability < ActiveRecord::Base
  TEN_HOURS_AGO = Time.current - 36000

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
      group_by(&:date).sort_by { |date, _availability| date }
  end

  def self.confirmed_count
    all.map { |avail| avail.confirmed_pickups.count }.inject(:+)
  end
end
