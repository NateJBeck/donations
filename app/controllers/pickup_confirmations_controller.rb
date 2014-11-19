class PickupConfirmationsController < ApplicationController
  def create
    pickup = find_pickup_from_url
    pickup.update(confirmed: true)
    render "confirmed"
  end

  private

  def find_pickup_from_url
    Pickup.find(params[:pickup_id])
  end
end
