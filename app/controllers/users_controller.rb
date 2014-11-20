class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    @user.dashboard = Dashboard.new
    if @user.save
      # Deliver the signup email
      UserNotifier.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end
end
