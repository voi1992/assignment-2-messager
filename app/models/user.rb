class User < ApplicationRecord
  has_secure_password

  has_many :send_messages, foreign_key:"sent_id",class_name: "Message"
  has_many :friends

  def add_friend(friend_id)
      self.friends << Friend.new(friend_id: friend_id)
      User.find(friend_id).friends << Friend.new(friend_id:self.id)
  end

  def sent_messages(params)
    self.send_messages << Message.new(params )
  end

  def inbox()
    Message.where(receive_id:self.id)
  end
end
