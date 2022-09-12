class Service < ApplicationRecord
  has_one_attached :icon
  validate :acceptable_icon

  def acceptable_icon
    return unless icon.attached?
  end
end
