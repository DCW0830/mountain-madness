class UsersController < ApplicationController
  def create
    binding.pry
    @user = User.new(params[:user])
    @user.dashboard = Dashboard.new
    if @user.save
      $client.update(current_user.twitter_name, "Welcome to Mountain Madness!!")
      UserNotifier.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end
end
