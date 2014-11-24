class Admin::AvailabilitiesController < AdminController
  def index
    @charity = Charity.find(params[:charity_id])
    @calendar = @charity.availabilities.group_by(&:date)
  end

  def new
    @charity = find_charity_from_url
    @availability = @charity.availabilities.new
  end

  def create
    charity = find_charity_from_url
    @availability = charity.availabilities.create(availability_params)
    redirect_to admin_charity_path(charity)
  end

  def show
    @availability = find_availability_from_url
    @confirmed_pickups = @availability.confirmed_pickups
    @unconfirmed_pickups = @availability.unconfirmed_pickups
    @town_name = @availability.town.name
  end

  private

  def find_availability_from_url
    Availability.find(params[:id])
  end

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end

  def availability_params
    params.require(:availability).permit(:charity_id, :town_id, :date)
  end
end
