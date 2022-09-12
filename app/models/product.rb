class Product < ApplicationRecord
  has_one_attached :image
  validate :acceptable_image

  def acceptable_image
    return unless image.attached?
  end
end
