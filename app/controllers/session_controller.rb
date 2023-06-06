class SessionsController < ApplicationController
  def create
    @user = User.authenticate_with_credentials(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end
end
