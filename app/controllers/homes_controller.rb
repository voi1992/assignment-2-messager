class HomesController < ApplicationController

  def index

  end

  def new_messages
    byebug
    current_user.sent_messages(message_params)
    render "homes/index"
  end

  def inbox
    @messages = Message.where(receive_id: current_user.id).order(created_at: :desc)
    render "homes/index"
  end

  def outbox
    @messages = current_user.send_messages.order(created_at: :desc)

    render "homes/index"
  end

  def show
    @message = Message.find_by_id(params[:message_id])
    @message.update_attributes(read:true)
    render "homes/index"
  end

  def add_friend
    current_user.add_friend(params[:friend_id])
    render "homes/index"
  end


private
  def find_user_id
      user = User.find_by_email(params[:email])
      params[:receive_id] = user.id
  end

  def message_params
    find_user_id
    params.permit(:title, :content,:receive_id)
  end

end
