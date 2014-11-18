class PresencesController < ApplicationController
  def new
    @charity = find_charity_from_url
    @presence = @charity.presences.new
  end

  def create
    charity = find_charity_from_url
    @presence = charity.presences.new(presence_params)

    if @presence.save
      redirect_to charity
    else
      render :new
    end
  end

  private

  def presence_params
    params.
      require(:presence).
      permit(:town_id).
      merge(charity_id: params[:charity_id])
  end

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end
end
