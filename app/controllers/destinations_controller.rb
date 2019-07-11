class DestinationsController < ApplicationController

  skip_before_action :authorized, only: [:create, :index, :show, :buy]

  def index
    @destinations = Destination.all
    render json: @destinations
  end

  def show
    @destination = Destination.find(params[:id])
    render json: @destination
  end

  def book
    # byebug
    @destination = Destination.find(params[:id])
    @trip = Trip.create(destination: @destination, user: @user)
    render json: @trip
  end


end
