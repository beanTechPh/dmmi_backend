json.admins do
  json.array! @admins do |admin|
    json.id               admin.id 
    json.name             admin.formal_name
    json.email            admin.email 
    json.mobile_no        admin.mobile_no
    json.address          admin.address
  end
end

json.pagination do
  json.page         @page 
  json.total_page   @total_page
end