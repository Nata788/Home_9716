class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    debugger
  end

  def new
  end

# Before filters

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
