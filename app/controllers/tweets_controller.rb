class TweetsController < ApplicationController
  before_action :check_user_login, except: [:index]
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

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
   
    @tweet.user = @current_user
        
        respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully posted.' }
        format.json { render action: 'show', status: :created, location: @tweet }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  private

 

  def tweet_params
    params.require(:tweet).permit(:content)
  end



end

