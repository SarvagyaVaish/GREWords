class UserMailer < ActionMailer::Base
  default from: "survy@vocabwhiz.com"

  def welcome_email(user)
    @user = user

    mail to: user.email, subject: "Welcome to GREWords App" 
  end
end
