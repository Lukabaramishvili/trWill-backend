class SubscriptionsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]

  def index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  def show
    @subscription = Subscription.find(params[:id])
    render json: @subscription
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.create(subscription_params)
    render json: @subscription
  end

  # def edit
  #   @subscription = Subscription.find(params[:id])
  # end

  # def update
  #   @subscription = Subscription.find(params[:id])
  #   @subscription.update(subscription_params)
  # end

  # def destroy
  #   @subscription = Subscription.find(params[:id])
  #   @subscription.destroy
  # end


  private
  def subscription_params
    params.require(:subscription).permit(:sub_type)
  end
end
