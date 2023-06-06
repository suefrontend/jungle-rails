class SessionController < ApplicationController
    def create
        if user = User.authenticate_with_credentials(params[:email], params[:password])
          # success logic, log them in
        else
          # failure, render login form
        end
      end
end
