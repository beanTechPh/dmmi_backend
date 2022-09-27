class Company < ApplicationRecord
  has_many :branches
  has_many :company_staffs 
  has_many :staffs, through: :company_staffs
  has_one_attached :logo
  has_many :inquiries 
  
  def equipments
    branches_ids = self.branches.pluck(:id)
    return Equipment.where(branch_id: branches_ids)
  end
  
end
