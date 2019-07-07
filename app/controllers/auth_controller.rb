class AuthController < ApplicationController

  skip_before_action :authorized, only: [:login, :auto_login]

  def login
    @user = User.find_by(username: user_login_params[:username])
    # byebug
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { errors: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def auto_login
    # if current_user
    #   render json: current_user
    # else
    #   render json: {errors: "Error"}
    # end
    # byebug
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:username, :password)
  end
end
