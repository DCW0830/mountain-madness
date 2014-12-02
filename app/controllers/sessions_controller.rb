class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    user.update(nickname: env['omniauth.auth']['info']['nickname'])
    if user.save
      Resque.enqueue(TwitterJob, user.nickname)
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
