class UsersController < ApplicationController
  
    def new
      @user = User.new
    end
    
    def create
       @user = User.new(params[:user])
        if @user.save
          redirect_to shouts_url, notice: "Thank you for registering!"
        else
          render "new"
        end
    end
end
