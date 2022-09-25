json.company do
  json.id           @company.id 
  json.name         @company.name 
  json.address      @company.address
  json.email        @company.email
  
  if @company.logo.attached? 
    json.logo       url_for(@company.logo)
  end
end