class UsersController < ApplicationController

  before_action :logged_in?, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to root_path
    else
      flash[:error] = "Email has already been taken"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def update
    current_params = params.require(:user).permit(:name, :password, :email, :credit)
    @user.update_attributes(current_params)
    redirect_to user_path
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :credit)
  end

end
