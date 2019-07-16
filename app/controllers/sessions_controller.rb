class SessionsController < ApplicationController
  def new
  end

  def create
    raise binding.params
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    session[:user_id] = @user.id
    @auth = auth

  end

  def destroy
    session.delete(:user_id) if session[:user_id]
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
