class AvailabilitiesController < ApplicationController
  def new
    charity = find_charity_from_url
    @availability = charity.availabilities.new
  end

  def create
    charity = find_charity_from_url
    @availability = charity.availabilities.new(availability_params)

    if @availability.save
      redirect_to charity
    else
      redirect_to charity
    end
  end

  private

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end

  def availability_params
    params.require(:availability).permit(:charity_id, :town_id, :date)
  end
end
