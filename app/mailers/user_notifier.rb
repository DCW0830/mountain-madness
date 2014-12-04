class UserNotifier < ActionMailer::Base
  default from: "wortham.aaron@gmail.com"
  
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
