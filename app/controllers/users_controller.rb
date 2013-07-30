class UsersController < ApplicationController
  before_action :check_user_login, except: [:new,:create]

  def index
  end

	def new
		@user = User.new
	end	

	def show
    	@user = User.find(params[:id])
  	end

  def create
    	@user = User.new(user_params)
      if @user.save
      flash.now[:success] = "Welcome back to Fake Twitter!"
      session[:user_id] = @user.id 
    	redirect_to(root_path)
      
  	  else
      render 'new'
      end
  end

  def update
    @current_user.update_attributes(user_params)
    redirect_to user_path(@current_user)

  end  

  private

  	def user_params
    	params.require(:user).permit(:name, :email, :handle, :password, :avatar, :remove_avatar)
  	end

end
