class CharitiesController < ApplicationController
  def show
    @charity = find_charity_from_url
    @towns = @charity.towns
    @availability = Availability.new
    @availabilities = @charity.availabilities
  end

  private

  def find_charity_from_url
    Charity.find(params[:id])
  end
end
