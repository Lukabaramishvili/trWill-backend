class TripsController < ApplicationController

  skip_before_action :authorized, only: [:create, :index, :show]
  
  def index
    @trips = Trip.all
    render json: @trips
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    render json: @trip
  end

  def show
    @trip = Trip.find(params[:id])
    render json: @trip
  end

  private
  def trip_params
    params.require(:trip).permit(:user_id, :destination_id)
  end
end
