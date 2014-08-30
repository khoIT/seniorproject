class UserMailer < ActionMailer::Base
  default from: "emails.khoi@gmail.com"
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Welcome to DePauw Rides"
  end
end
