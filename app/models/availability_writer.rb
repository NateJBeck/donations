require "csv"

class AvailabilityWriter
  def initialize(availabilities)
    @availabilities = availabilities
  end

  def to_csv
    CSV.generate do |csv|
      csv << ["Date", "Address"]
      @availabilities.each do |availability|
        availability.confirmed_pickups.each do |pickup|
          csv << [availability.date, pickup.address]
        end
      end
    end
  end
end
