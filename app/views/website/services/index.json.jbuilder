json.services do
  json.array! @services do |service|
    json.id               service.id
    json.name             service.name 
    json.description      service.description
    json.icon            url_for(service.icon)
  end
end