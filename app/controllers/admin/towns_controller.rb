class Admin::TownsController < AdminController
  def index
    @charity = find_charity_from_url
    @towns = @charity.towns.order(:name)
    @presence = @charity.presences.new
    @presences = @charity.presences
  end

  private

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end
end
