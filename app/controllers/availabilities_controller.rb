class AvailabilitiesController < ApplicationController
  def index
    if params[:filter]
      @availabilities = Availability.next_six_availabilities(filter_params)
    end
  end

  def show
    @pickup = Pickup.new
  end

  private

  def filter_params
    params.require(:filter).
      permit(:town_id, :charity_id).
      select { |_, value| value.present? }
  end
end
