class AvailabilityCalendar
  ONE_DAY = 24.hours
  ONE_WEEK = 7.days
  ONE_YEAR = 365.days

  def initialize(availabilities)
    @availabilities = availabilities
  end

  def recently_created
    @availabilities.where("created_at > ?", 10.hours.ago)
  end

  def tomorrow
    @availabilities.where(date: ONE_DAY.from_now)
  end

  def this_week
    availabilities_within([ONE_DAY.from_now .. ONE_WEEK.from_now])
  end

  def next_365_days
    availabilities_within([Time.now .. ONE_YEAR.from_now])
  end

  def tomorrow_confirmed_count
    tomorrow.map { |avail| avail.confirmed_pickups.count }.inject(:+)
  end

  def weeks_confirmed_count
    @availabilities.
      where(date: [ONE_DAY.from_now .. ONE_WEEK.from_now]).
      map { |availability| availability.confirmed_pickups.count }.
      inject(:+)
  end

  private

  def availabilities_within(range)
    @availabilities.
      where(date: range).
      group_by(&:date).
      sort_by { |date, _| date }
  end
end
