class Equipment < ApplicationRecord
  belongs_to :product_type
  belongs_to :branch
  has_many_attached :images

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
    
    if filters[:brand_filter].present?
      equipments = equipments.where(brand: filters[:brand_filter])
    end

    return equipments
  end

  def self.generate_serial_no
    last_equipment = Equipment.last 

    if last_equipment.present? 
      last_year = last_equipment.serial_no.split("-").first.to_i
      last_num = last_equipment.serial_no.split("-").last.to_i

      if last_year == DateTime.now.year
        num = (last_num + 1).to_s.rjust(5, '0')
        return "#{last_year}-#{num}"
      end
    end

    year = DateTime.now.year
    num = 1.to_s.rjust(5, '0')

    return "#{year}-#{num}"
  end
  
  def self.generate_url_code
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten

    code = ''
    loop do
      code = (0...50).map { o[rand(o.length)] }.join

      break if !Equipment.find_by(url_code: code).present?
    end

    return code
  end
  
end
