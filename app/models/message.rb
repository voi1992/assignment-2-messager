class Message < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "sent_id"
end
