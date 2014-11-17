class PickupDatesController < ApplicationController
  def new
    charity = find_charity_from_url
    @pickup_date = charity.pickup_dates.new
  end

  def create
    charity = find_charity_from_url
    @pickup_date = charity.pickup_dates.new(pickup_date_params)

    if @pickup_date.save
      redirect_to charity
    else
      render :new
    end
  end

  private

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end

  def pickup_date_params
    params.require(:pickup_date).permit(:date)
  end
end
