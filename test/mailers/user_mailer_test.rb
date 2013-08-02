require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  tests UserMailer
		
    test "user confirmation email is sent to new user's email" do 
    
    user = users(:one)
    email = UserMailer.confirm_email(user).deliver

    assert !ActionMailer::Base.deliveries.empty?

    assert_equal ['info@shittytwitter.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Confirm your email for fake Twitter', email.subject
	 
  end
end

