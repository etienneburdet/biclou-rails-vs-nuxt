class BikesController < ApplicationController
    before_action :set_bike, only: %i[ create destroy ]
    skip_before_action :authenticate_user!, only: :search

    def index
      @bikes = policy_scope(Bike).order(created_at: :desc)
      # @bike = Bike.new
      # authorize @bike
    end

    # def create
    #   @bike = Bike.new(bike_params)
    #   @bike.available = true
    #   @bike.user = current_user
    #   if @bike.save
    #     redirect_to bikes_path
    #   else
    #     render 'bikes/index'
    #   end
    # end
    #
    # def update
    #   @bike.available = old_status
    #   @bike.update_column(:avalaible, !old_status)
    #   authorize @bike
    # end
    #
    # def destroy
    #   @bike.destroy
    #   authorize @bike
    # end
    #
    # private
    #
    # def bike_params
    #   params.require(:bike).permit(:name, :description, :photo, :address)
    # end
    #
    # def set_bike
    #   @bike = Bike.find(params[:id])
    # end
end
