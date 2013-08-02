class UserMailer < ActionMailer::Base
  default from: "info@shittytwitter.com"

  def confirm_email(user)  
    @user = user
    mail(to: user.email, subject: "Confirm your email for fake Twitter")
  end

end
