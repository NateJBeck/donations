class Admin::TownsController < AdminController
  def index
    @charity = find_charity_from_url
    @towns = @charity.towns
    @presence = @charity.presences.new
  end

  private

  def find_charity_from_url
    Charity.find(params[:charity_id])
  end
end
