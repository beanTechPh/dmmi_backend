json.staffs do
  json.array! @staffs do |staff|
    json.id               staff.id 
    json.name             staff.formal_name
    json.email            staff.email 
    json.mobile_no        staff.mobile_no
    json.address          staff.address
  end
end

json.pagination do
  json.page         @page 
  json.total_page   @total_page
end