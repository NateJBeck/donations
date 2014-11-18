class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    if signed_in?
      if current_user.admin?
        @charity = find_admins_charity
      end
    else
      redirect_to availabilities_path
    end
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def find_admins_charity
    Charity.find(current_user.charity_id)
  end
end
