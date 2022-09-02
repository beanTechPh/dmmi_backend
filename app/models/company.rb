class Company < ApplicationRecord
  has_many :branches
  
  def equipments
    branches_ids = self.branches.pluck(:id)
    return Equipment.where(branch_id: branches_ids)
  end
  
end
