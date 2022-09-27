class Client::InquiriesController < ClientController

  def tech_support
    equipment = Equipment.find(params[:equipment_id])

    inquiry = Inquiry.new(
      company_id: @current_user.company.id,
      subject: "Tech Supp - #{equipment.name}(#{equipment.serial_no})"
    )

    inquiry.save! 

    Message.create!(
      inquiry_id: inquiry.id,
      user: @current_user,
      body: params[:body],
      is_read: false
    )

    render json: {}, status: 200
  rescue => e 
    logger.info("\n\n\n\n #{e} \n\n\n\n")
    render json: {error: e}, status: 500 
  end
  
end