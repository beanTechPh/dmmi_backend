class Client::MessagesController < ClientController

  def index
    @company = @current_user.company
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    @inquiry = @company.inquiries.find(params[:inquiry_id])
    @messages = @inquiry.messages

    @messages = @messages.offset(offset * num_of_items).limit(num_of_items)

    @messages.unread.update_all(is_read: true)
  end
  
  def create
    @message = Message.new(
      body: params[:body],
      inquiry_id: params[:inquiry_id],
      is_read: false,
      user: @current_user
    )

    @message.save! 

    render status: 200
  rescue => e 
    logger.info("\n\n\n\n #{e} \n\n\n\n")
    render json: {error: e}, status: 500 
  end
  
end