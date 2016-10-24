class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
