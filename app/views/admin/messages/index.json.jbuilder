json.inquiry do
  json.id               @inquiry.id 
  json.subject          @inquiry.subject
  json.last_message     @inquiry.messages.last 
  json.num_unread       @inquiry.messages.unread.count
  json.date             @inquiry.messages.last.created_at.in_time_zone("Asia/Manila").strftime("%b %e, %Y")
  json.company do
    json.id           @company.id 
    json.name         @company.name 
    json.address      @company.address
    json.email        @company.email
    
    if @company.logo.attached? 
      json.logo       url_for(@company.logo)
    end
  end
end

json.messages do
  json.array! @messages do |message|
    json.id                 message.id 
    json.user_type          message.user_type
    json.user_id            message.user_id 
    json.body               message.body
    json.date               message.created_at.in_time_zone("Asia/Manila").strftime("%b %e, %Y - %l:%M %p")
  end
end

json.pagination do
  json.page         @page 
end