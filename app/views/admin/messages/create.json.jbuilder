json.message do
  json.id                 @message.id 
  json.user_type          @message.user_type
  json.user_id            @message.user_id 
  json.body               @message.body
  json.date               @message.created_at.in_time_zone("Asia/Manila").strftime("%b %e, %Y - %l:%M %p")
end