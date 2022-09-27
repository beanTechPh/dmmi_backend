class Message < ApplicationRecord
  belongs_to :inquiry
  belongs_to :user, polymorphic: true
end
