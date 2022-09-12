json.services do
  json.array! @services do |service|
    json.id               service.id
    json.name             service.name 
    json.description      service.description
    json.icon            url_for(service.icon)
  end
end

json.products do
  json.array! @products do |product|
    json.id               product.id
    json.name             product.name 
    json.image            url_for(product.image)
    json.raw_material     product.raw_material
    json.coating          product.coating
    json.color            product.color 
    json.application      product.application 
    json.usage            product.usage
  end
end