class Admin::AvailabilitiesController < AdminController
  def index
    @charity = Charity.find(params[:charity_id])
    @tomorrows_availabilities = @charity.tomorrows_availabilities
    @upcoming_availabilities = @charity.upcoming_availabilities
    @all_availabilities_calendar = @charity.availability_calendar

    @tomorrows_confirmed = add_up_tomorrows_confirmed_pickups(
      @tomorrows_availabilities
    )

    @weeks_confirmed_count = add_up_weeks_confirmed_pickups(
      @upcoming_availabilities
    )
  end

  def new
    @charity = find_charity_from_url
    @availability = @charity.availabilities.new
    @newly_made_availabilities = @charity.recently_created_availabilities
  end

  def create
    charity = find_charity_from_url
    @availability = charity.availabilities.create(availability_params)
    redirect_to new_admin_charity_availability_path(charity)
  end

  def show
    @availability = find_availability_from_url
    @confirmed_pickups = @availability.confirmed_pickups
    @unconfirmed_pickups = @availability.unconfirmed_pickups
    @town_name = @availability.town.name
  end

  def destroy
    charity = find_charity_from_url
    charity.availabilities.find(params[:id]).destroy
    redirect_to admin_charity_path(charity)
  end

  private

  def add_up_tomorrows_confirmed_pickups(availabilities)
    availabilities.map { |avail| avail.confirmed_pickups.count }.inject(:+)
  end

  def add_up_weeks_confirmed_pickups(availabilities_grouped_by_date)
    count = 0
    availabilities_grouped_by_date.each do |date, availabilities|
      availabilities.each do |availability|
        count += availability.confirmed_pickups.count
      end
    end
    count
  end

  def find_availability_from_url
    Availability.find(params[:id])
  end

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end

  def availability_params
    params.require(:availability).
      permit(:charity_id, :town_id, :date)
  end
end
