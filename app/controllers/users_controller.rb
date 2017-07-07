class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :show, :destroy, :new]
  before_action :admin, only: [:edit, :update, :new, :create, :destroy]
  before_action :nata, only: [:show, :edit]
  before_action :correct_user, only: [:edit, :update, :index, :show, :destroy, :new]

  def show
    @user = @nata
  end

  def edit
    @user = @nata
  end

  def new
    if current_user.admin
      @user = User.new
    else
      flash[:danger] = "Запрашиваемая Вами страница недоступна для простых смертных.."
      redirect_to root_path
    end
  end

  def create
    if current_user.admin
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "User #{@user.email} is now in your database!"
        redirect_to users_path
      else
        render 'new'
      end
    else
      flash[:danger] = "Запрашиваемая Вами страница недоступна для простых смертных.."
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      if current_user.admin?
        redirect_to users_path
      else
        redirect_to @user
      end
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.admin
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_path
    else
      flash[:danger] = "Запрашиваемая Вами страница недоступна для простых смертных.."
      redirect_to root_path
    end
  end

  def index
    if current_user.admin
      @user = User.all
    else
      flash[:danger] = "Запрашиваемая Вами страница недоступна для простых смертных.."
      redirect_to root_path
    end
  end

  private

  def nata
    @nata = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :floor_number, :admin)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    unless session[:user_id].to_i == params[:id].to_i
      flash[:danger] = "Запрашиваемая Вами страница недоступна"
      redirect_to root_path
    end
  end

end
