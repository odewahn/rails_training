class SessionsController < ApplicationController
  
     def new
     end
     
     def create
        if user = User.find_by_email(params[:session][:email])
           cookies.permanent.signed[:user_id] = user.id
        end
        redirect_to shouts_path
     end
     
     def destroy
         cookies.delete :user_id
         redirect_to sign_in_path
      end
     
end
