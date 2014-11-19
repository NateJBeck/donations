class PickupsController < ApplicationController
  def new
    @availability = find_availability_from_url
    @pickup = @availability.pickups.new
  end

  def create
    availability = find_availability_from_url
    pickup = availability.pickups.new(pickup_params)
    if pickup.save
      associate_donor_for(params[:email], pickup)
      redirect_to availability_pickup_path(availability, pickup)
    else
      render :new
    end
  end

  def show
    @availability = find_availability_from_url
    @pickup = Pickup.find(params[:id])
  end

  private

  def find_availability_from_url
    Availability.find(params[:availability_id])
  end

  def pickup_params
    params.require(:pickup).
      permit(:address, :town_id, :telephone)
  end

  def associate_donor_for(email, pickup)
    donor = Donor.find_or_initialize_by(email: email)
    donor.pickup_id = pickup.id
    donor.save
  end
end