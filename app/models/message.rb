class Message < ApplicationRecord
  belongs_to :inquiry
  belongs_to :user, polymorphic: true

  def self.unread
    self.where(is_read: false)
  end
  
end
