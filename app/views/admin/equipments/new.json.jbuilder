json.companies do
  json.array! @companies do |company|
    json.id         company.id 
    json.name       company.name
  end
end

json.product_types do
  json.array! @product_types do |product_type|
    json.id         product_type.id 
    json.name       product_type.name
  end
end

json.branches do
  json.array! @branches do |branch|
    json.id             branch.id 
    json.name           branch.name 
    json.company_id     branch.company_id
  end
end