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