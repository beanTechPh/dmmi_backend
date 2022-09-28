json.inquiries do
  json.array! @inquiries do |inquiry|
    json.id               inquiry.id 
    json.subject          inquiry.subject
    json.last_message     inquiry.messages.last 
    json.num_unread       inquiry.messages.admin_unread.count
    json.date             inquiry.messages.last.created_at.in_time_zone("Asia/Manila").strftime("%b %e, %Y")
    json.company do
      json.id           inquiry.company.id 
      json.name         inquiry.company.name 
      json.address      inquiry.company.address
      json.email        inquiry.company.email
      
      if inquiry.company.logo.attached? 
        json.logo       url_for(inquiry.company.logo)
      end
    end
  end
end

json.companies do
  json.array! @companies do |company|
    json.id           company.id 
    json.name         company.name 
    json.address      company.address
    json.email        company.email
    
    if company.logo.attached? 
      json.logo       url_for(company.logo)
    end
  end
end

json.pagination do
  json.page         @page 
  json.total_page   @total_page
end