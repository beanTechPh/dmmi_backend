class Message < ApplicationRecord
  belongs_to :inquiry
  belongs_to :user, polymorphic: true

  def self.unread
    self.where(is_read: false)
  end
  
  def self.admin_unread
    self.where(is_admin_read: false)
  end
  
end
