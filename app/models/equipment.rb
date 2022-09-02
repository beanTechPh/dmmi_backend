class Equipment < ApplicationRecord
  belongs_to :product_type
  belongs_to :branch

  def age
    "10years"
  end
  
  def self.filters(filters)
    equipments = self.all 
    
    if filters[:type_filter].present?
      product_type = ProductType.find_by(name: filters[:type_filter])

      equipments = equipments.where(product_type_id: product_type.id)
    end
    
    if filters[:origin_filter].present?
      equipments = equipments.where(origin: filters[:origin_filter])
    end
    
    if filters[:branch_filter].present?
      branch = Branch.find_by(name: filters[:branch_filter])

      equipments = equipments.where(branch_id: branch.id)
    end

    return equipments
  end
  
end
