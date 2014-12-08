class Admin::CharitiesController < AdminController
  def show
    @charity = find_admins_charity
    @towns = @charity.towns.order(:name)
    @availability = Availability.new
    @availabilities = @charity.availabilities
    @calendar = AvailabilityCalendar.new(@availabilities)
    @tomorrow = Date.tomorrow
  end

  private

  def find_admins_charity
    Charity.find(current_user.charity_id)
  end
end
