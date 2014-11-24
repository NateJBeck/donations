class AdminController < ApplicationController
  before_filter :require_admin
  before_filter :require_appropriate_admin

  private

  def require_admin
    if !current_user.admin?
      redirect_to availabilities_path
    end
  end

  def require_appropriate_admin
    if params[:charity_id]
      if current_user.charity_id != params[:charity_id].to_i
        redirect_to availabilities_path
      end
    end
  end
end
