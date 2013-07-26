class TweetsController < ApplicationController
  before_action :check_user_login

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = User.first
    @tweet.save
    redirect_to user_path(@tweet.user)
  end

  private

  def check_user_login
    @current_user = User.find(session[:user_id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end

