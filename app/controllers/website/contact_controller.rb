class Website::ContactController < WebsiteController
  def create
    contact = Contact.new(contact_params)

    if contact.save!
      render json: {success: true}, status: 200
    else
      render json: {success: false}, status: 500
    end
  end
  

  private 
    def contact_params
      params.permit(:name, :company, :email, :mobile, :message)
    end
    
end