class LoginsController < ApplicationController

  def new_session
  	@user = User.new
  end

  def create_session

  	#user = User.find_by(email: params[:user][:email])
    user = User.find_by_email_and_password(params[:user][:email],params[:user][:password])
    
     	if user
        session[:user_id] = user.id 
        redirect_to user_path(user)
  	  else
        flash[:error] = 'Invalid email/password combination'
     	  redirect_to sign_in_path

      end

  end
  	
  

  def logout
  end

 
end
