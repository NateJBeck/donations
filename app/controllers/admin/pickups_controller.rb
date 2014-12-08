class Admin::PickupsController < ApplicationController
  def index
    charity = find_charity_from_url
    @date = params[:date]
    @availabilities = charity.availabilities.where(date: @date)

    respond_to do |format|
      writer = AvailabilityWriter.new(@availabilities)
      format.html
      format.csv { send_data writer.to_csv }
    end
  end

  def new
    @availability = find_availability_from_url
    @pickup = @availability.pickups.new
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
end
