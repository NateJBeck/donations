class CharitiesController < ApplicationController
  def show
    @charity = find_charity_from_url
    @pickup_dates = @charity.pickup_dates
  end

  private

  def find_charity_from_url
    Charity.find(params[:id])
  end
end
