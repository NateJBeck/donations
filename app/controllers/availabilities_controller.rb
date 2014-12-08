class AvailabilitiesController < ApplicationController
  def index
    if signed_in? && current_user.admin?
      render "admin/charities/_welcome"
    end
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
