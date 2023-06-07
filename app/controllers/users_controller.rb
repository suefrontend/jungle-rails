class UsersController < ApplicationController
    def signup
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        # Handle successful signup
        redirect_to root_path, notice: 'User created successfully!'
      else
        # Handle signup failure
        render :signup
      end
    end
  
    def login
    end
  
    def authenticate
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :login
      end
    end
  
    def logout
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully!'
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
  