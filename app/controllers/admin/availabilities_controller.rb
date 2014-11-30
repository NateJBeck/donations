class Admin::AvailabilitiesController < AdminController
  def index
    @charity = Charity.find(params[:charity_id])
    @availabilities = @charity.availabilities
    @weeks_confirmed_count = weeks_confirmed(@availabilities.for_the_week)
  end

  def new
    @charity = find_charity_from_url
    @availability = @charity.availabilities.new
    @newly_made_availabilities = @charity.availabilities.recently_created
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

  def weeks_confirmed(availabilities_grouped_by_date)
    count = 0
    availabilities_grouped_by_date.each do |_date, availabilities|
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
