json.equipments do
  json.array! @equipments do |equipment|
    json.id           equipment.id 
    json.name         equipment.name 
    json.type         equipment.product_type 
    json.serial_no    equipment.serial_no
    json.description  equipment.description
    json.branch do
      json.id             equipment.branch.id 
      json.name           equipment.branch.name 
      json.company_id     equipment.branch.company_id
    end
    json.age          equipment.age
    json.brand        equipment.brand
    json.date         equipment.installed_date.strftime("%b %e, %Y")
  end
end

json.pagination do
  json.page         @page 
  json.total_page   @total_page
end

json.types do
  json.array! ProductType.all do |type|
    json.name       type.name
  end
end

json.branches do
  json.array! @branches.all do |branch|
    json.name       branch.name
  end
end

json.brands       @brands