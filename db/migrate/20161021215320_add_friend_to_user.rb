class AddFriendToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :friends, :user
  end
end
