class Admin::AvailabilitiesController < AdminController
  def index
    @charity = Charity.find(params[:charity_id])
    @availabilities = @charity.availabilities
    @calendar = AvailabilityCalendar.new(@availabilities)
  end

  def new
    @charity = find_charity_from_url
    @availability = @charity.availabilities.new
    @calendar = AvailabilityCalendar.new(@charity.availabilities)
  end

  def create
    charity = find_charity_from_url
    @availability = charity.availabilities.create(availability_params)
    redirect_to new_admin_charity_availability_path(charity)
  end

  def show
    @availability = find_availability_from_url
    @town_name = @availability.town.name
  end

  def destroy
    charity = find_charity_from_url
    charity.availabilities.find(params[:id]).destroy
    redirect_to admin_charity_path(charity)
  end

  private

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
