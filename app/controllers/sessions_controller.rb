class SessionsController < ApplicationController
  def new
  end

  def create
    if params
      @user = User.find_by(id: params[:user][:id])
      puts params
      puts @user
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        puts "Unauthenticated"
        redirect_to signin_path
      end
    elsif auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
      end
      session[:user_id] = @user.id
      @auth = auth
    else
      redirect_to signin_path
    end


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
