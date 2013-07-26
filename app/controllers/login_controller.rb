class LoginController < ApplicationController

  def new_session
  	@user = User.new
  end

  def create_session

  	user = User.find_by(email: params[:user][:email])
  	if user
  		session[:user_id] = user.id 
  		redirect_to user_path(user)
  	else
  		redirect_to new_user_path
  	end
  end		

  def logout
  end

 
end
