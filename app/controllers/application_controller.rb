class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 def check_user_login
    @current_user = User.find(session[:user_id])
  end

    protected
    def not_found
      flash[:error] = "You need to log in to tweet."
      redirect_to sign_in_path
    end
  

    
end
