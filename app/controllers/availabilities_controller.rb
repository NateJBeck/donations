class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.where(filter_params).order(:date)
    @upcoming_availabilities = @availabilities.next_two_months
  end

  def show
    @pickup = Pickup.new
  end

  private

  def filter_params
    if params[:filter]
      params.require(:filter).
        permit(:town_id, :charity_id).
        select { |key, value| value.present? }
    else
      {}
    end
  end
end
