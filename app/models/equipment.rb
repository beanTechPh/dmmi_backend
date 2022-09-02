class Equipment < ApplicationRecord
  belongs_to :product_type
  belongs_to :branch

  def age
    "10years"
  end
  
end
