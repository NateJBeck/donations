class Admin::PresencesController < AdminController
  def new
    @charity = find_charity_from_url
    @presence = @charity.presences.new
    @towns = Town.order(:name)
  end

  def create
    charity = find_charity_from_url
    @presence = charity.presences.new(presence_params)
    if @presence.save
      redirect_to admin_charity_towns_path(charity)
    else
      render :new
    end
  end

  def destroy
    charity = Charity.find(params[:charity_id])
    presence = Presence.find(params[:id])
    presence.destroy

    redirect_to admin_charity_towns_path(charity)
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
