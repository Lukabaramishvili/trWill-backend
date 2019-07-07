class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    # byebug
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end
  #
  def update
    # byebug
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: { user: UserSerializer.new(@user) }
  end
  #
  # def destroy
  #   @user = @user.find(params[:id])
  #   @user.destroy
  # end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :subscription_id)
  end
end
