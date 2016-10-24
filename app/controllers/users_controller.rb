class UsersController < ApplicationController

  def index

    if !!params[:friendlst]
      @users = User.where("id in (?)", current_user.friends.map { |x| x.friend_id })
    else
        friend_added_id = current_user.friends.map { |x| x.friend_id }
        if friend_added_id.empty?
          @users = User.all
        else
          @users = User.where("id NOT IN (?)", friend_added_id)
        end

    end
  end

  def new

  end

  def create
    @user = User.new user_params
    if @user.save!

      session[:user_id] = @user.id
      redirect_to root_path
    else

      redirect_to new_user_path
    end
  end


  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
