class PickupsController < ApplicationController
  def index
    charity = find_charity_from_url
    if params[:date]
      @date = params[:date]
      @availabilities = charity.availabilities.where(date: @date)
    end
  end

  def new
    @availability = find_availability_from_url
    @pickup = @availability.pickups.new
  end

  def create
    availability = find_availability_from_url
    pickup = availability.pickups.new(pickup_params)
    if pickup.save
      donor = associate_donor_for(params[:email], pickup)
      send_confirmation_email_to(donor)
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

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end

  def find_availability_from_url
    Availability.find(params[:availability_id])
  end

  def pickup_params
    params.require(:pickup).
      permit(:address, :town_id, :telephone)
  end

  def associate_donor_for(email, pickup)
    donor = Donor.find_or_initialize_by(email: email)
    donor.update(pickup_id: pickup.id)
    donor
  end

  def send_confirmation_email_to(donor)
    DonorMailer.test_email(donor).deliver
  end
end
