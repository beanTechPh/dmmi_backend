class Admin::InquiriesController < AdminController

  def index
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    inquiries = Inquiry.all.order(id: :desc)
    @companies = Company.all

    if !params[:keyword].present?
      @inquiries = inquiries
      num_of_inquiries = @inquiries.count
    else
      keywords = params[:keyword].split(' ').map{|kw| "%#{kw}%"}

      it = Inquiry.arel_table
      @inquiries = inquiries.where(
        it[:subject].matches_all(keywords)
      )
      
      num_of_inquiries = @inquiries.count
    end

    @inquiries = @inquiries.offset(offset * num_of_items).limit(num_of_items)

    @total_page = (num_of_inquiries.to_f/num_of_items.to_f).ceil
  end

  def create
    inquiry = Inquiry.new(inquiry_params)
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
  
  private 
    def inquiry_params
      params.permit(:subject, :company_id)
    end
    
end