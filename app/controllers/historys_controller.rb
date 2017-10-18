class HistorysController < ApplicationController

  before_action :logged_in?, only: [:edit, :update]
  before_action :set_histroy, only: [:show, :edit, :update]

  def index
    @historys = Histroy.all
  end

  def new
  end

  def create
    histroy = Histroy.new(histroy_params)
    if histroy.save
      login(histroy)
      redirect_to root_path
    else
      flash[:error] = "Email has already been taken"
      redirect_to new_histroy_path
    end
  end

  def show
    @histroy = Histroy.find_by_id(params[:id])
  end

  def edit
  end

  def update
    current_params = params.require(:histroy).permit(:name, :password, :email, :credit)
    @histroy.update_attributes(current_params)
    redirect_to histroy_path
  end

  def destroy
    @histroy = Histroy.find_by_id(params[:id])
    @histroy.destroy
    redirect_to root_path
  end

  private

  def histroy_params
    params.require(:histroy).permit(:name, :email, :password, :credit)
  end

end
