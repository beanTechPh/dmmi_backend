json.equipment do
  json.id           @equipment.id 
  json.name         @equipment.name 
  json.type         @equipment.product_type.name 
  json.serial_no    @equipment.serial_no
  # json.origin       @equipment.origin.capitalize 
  json.description  @equipment.description
  json.branch       @equipment.branch.name 
  json.age          @equipment.age
  if @equipment.images.attached?
    json.images do
      json.array! @equipment.images.collect{|image| url_for(image)}
    end
  else
    json.images     []
  end
end