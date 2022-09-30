json.contacts do
  json.array! @contacts do |contact|
    json.id               contact.id 
    json.name             contact.name
    json.company          contact.company
    json.email            contact.email 
    json.mobile           contact.mobile
    json.message          contact.message
  end
end

json.pagination do
  json.page         @page 
  json.total_page   @total_page
end