require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  def login_as(user)
    session[:user_id] = user.id

  end

  test "tweet has a user" do
    tweet = tweets(:one)
    assert tweet.user != nil, "tweet doesn't have a user"
  end  

  test "should get index when logged in" do
    login_as(users(:one))
    get :index
    assert_response :success
  end

  test "should get show" do
    login_as(users(:one))
    get :show, :id => tweets(:one).id
    assert_response :success
  end

  test "should get new" do
    login_as(users(:one))
    get :new
    assert_response :success
  end

  test "should get create when logged in" do
    login_as(users(:one))
    post :create, tweet: {content: "Some valid content"}
    assert_redirected_to tweets_path
  end

end
