class BikesController < ApplicationController
  before_action :set_bike, only: %i[update destroy]
  skip_before_action :authenticate_user!, only: :search

  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)
    @bike = Bike.new
  end

  def search
    @bikes = Bike.where(available: true).near(params[:q])
    authorize @bikes
    @place = params[:q]
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.available = true
    @bike.user = current_user
    authorize @bike
    if @bike.save
      redirect_to bikes_path
    else
      @bikes = policy_scope(Bike).order(created_at: :desc)
      render :index
    end
  end

  def update
    @bike.update_column(:available, !@bike.available)
    authorize @bike
    if @bike.save
      redirect_to bikes_path
    else
      @bikes = policy_scope(Bike).order(created_at: :desc)
      render :index
    end
  end
  #
  # def destroy
  #   @bike.destroy
  #   authorize @bike
  # end
  #
  private

  def bike_params
    params.require(:bike).permit(:name, :description, :photo, :address, :price_per_hour)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
