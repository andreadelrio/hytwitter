class LoginsController < ApplicationController

  def new_session
  	@user = User.new
  end

  def create_session

  	#user = User.find_by(email: params[:user][:email])
    user = User.find_by(email: params[:user][:email])
    
     	if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id 
        redirect_to user_path(user)
  	  else
        flash[:error] = 'Invalid email/password combination'
     	  redirect_to sign_in_path

      end

  end
  	
  

  def logout
      session[:user_id] = nil
      #reset_session
      redirect_to sign_in_path
  end

 
end
