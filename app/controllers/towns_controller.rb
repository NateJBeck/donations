class TownsController < ApplicationController
  def new
    charity = find_charity_from_url
    @town = charity.towns.new
  end

  def create
    charity = find_charity_from_url
    @town = charity.towns.new(town_params)

    if @town.save
      redirect_to charity
    else
      render :new
    end
  end

  private

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end

  def town_params
    params.require(:town).permit(:name, :zipcode)
  end
end
