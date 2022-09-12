if @product.present?
  json.custom_product do
    json.id                     @product.id 
    json.name                   @product.name
    json.serial_number          @product.serial_number
    json.product_type           @product.product_type.name
    json.product_sheet          url_for(@product.product_sheet)
    json.images                 @product.images.map{|image| url_for(image)}
  end
else
  json.custom_product           nil
end