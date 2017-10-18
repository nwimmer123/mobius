class HistorysController < ApplicationController

  before_action :logged_in?, only: [:edit, :update]
  before_action :set_history, only: [:show, :edit, :update]

  def index
    @historys = History.all
  end

  def new
  end

  def create
    @history = History.new(history_params)
    @history.user = current_user
    @history.save
    redirect_to root_path
  end

  def show
    @history = History.find_by_id(params[:id])
  end

  def edit
  end

  def update
    current_params = params.require(:history).permit(:credit)
    @history.update_attributes(current_params)
    redirect_to history_path
  end

  def destroy
    @history = History.find_by_id(params[:id])
    @history.destroy
    redirect_to root_path
  end

  private

  def history_params
    params.require(:history).permit(:credit)
  end

end
