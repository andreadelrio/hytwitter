class UsersController < ApplicationController
  before_action :check_user_login, except: [:new,:create]

  def index
  end

	def new
		@user = User.new
	end	

	def show
    	@user = User.find(params[:id])
      @tweet = Tweet.new
  	end

  def create
    	@user = User.new(user_params)
     
      if @user.save
       UserMailer.confirm_email(@user).deliver #"confirm_email" method under => app/mailers/user_mailer.rb
       redirect_to user_path(@user)
      else
      render 'new'
    end
  end

  def update
    @current_user.update_attributes(user_params)
    redirect_to user_path(@current_user)
  end  

  def confirm
    head :ok
  end

  private

  	def user_params
    	params.require(:user).permit(:name, :email, :handle, :password, :avatar, :remove_avatar, :password_confirmation)
  	end

end
