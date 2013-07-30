require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  def login_as(user)
    session[:user_id] = user
  end

  test "should get index when logged in" do
    login_as(users(:one))
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create when logged in" do
    login_as(users(:one))
    post :create, tweet: {content: "Some valid content"}
    assert_redirected_to tweets_path
  end

end
