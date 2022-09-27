json.inquiries do
  json.array! @inquiries do |inquiry|
    json.id               inquiry.id 
    json.subject          inquiry.subject
    json.last_message     inquiry.messages.last 
    json.num_unread       inquiry.messages.unread.count
    json.date             inquiry.messages.last.created_at.strftime("%b %e, %Y")
  end
end

json.pagination do
  json.page         @page 
  json.total_page   @total_page
end