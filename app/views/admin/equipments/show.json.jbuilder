json.equipment do
  json.id           @equipment.id 
  json.name         @equipment.name 
  json.type         @equipment.product_type.name 
  json.serial_no    @equipment.serial_no
  # json.origin       @equipment.origin.capitalize 
  json.description  @equipment.description
  json.branch       @equipment.branch.name 
  json.age          @equipment.age
  json.brand        @equipment.brand
  json.installed_date         @equipment.installed_date.strftime("%b %e, %Y")
  
  if @equipment.images.attached?
    json.images do
      json.array! @equipment.images.collect{|image| url_for(image)}
    end
  else
    json.images     []
  end
  
  if @equipment.schematics.attached?
    json.schematics do
      json.array! @equipment.schematics.collect{|schematic| url_for(schematic)}
    end
  else
    json.schematics     []
  end

  json.components do
    json.array! @equipment.components do |component|
      json.id             component.id 
      json.name           component.name 
      json.brand          component.brand 
      json.qty            component.qty 
      json.description    component.description
      json.image          component.image.attached? ? url_for(component.image) : ""
    end
  end
end