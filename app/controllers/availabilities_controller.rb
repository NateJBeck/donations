class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.where(filter_params)
  end

  def new
    charity = find_charity_from_url
    @availability = charity.availabilities.new
  end

  def create
    charity = find_charity_from_url
    @availability = charity.availabilities.new(availability_params)
    try_to_save_the_availability(@availability, charity)
  end

  def show
    @availability = find_availability_from_url
    @pickup = Pickup.new
  end

  private

  def find_availability_from_url
    Availability.find(params[:id])
  end

  def filter_params
    if params[:filter]
      params.require(:filter).
        permit(:town_id, :charity_id).
        select { |key, value| value.present? }
    else
      {}
    end
  end

  def try_to_save_the_availability(availability, charity)
    if availability.save
      redirect_to charity
    else
      redirect_to charity
    end
  end

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end

  def availability_params
    params.require(:availability).permit(:charity_id, :town_id, :date)
  end
end
