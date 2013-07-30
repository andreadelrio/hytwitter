require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "should get new_session" do
    get :new_session
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_redirected_to root_url
  end

end
