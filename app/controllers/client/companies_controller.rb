class Client::CompaniesController < ClientController 
  
  def create
    company = Company.new(company_params)
    company.save!

    CompanyStaff.create!(
      company_id: company.id,
      staff_id: @current_user.id
    )

    render json: {}, status: 200
  rescue => e 
    logger.info("\n\n\n\n #{e} \n\n\n\n")
    render json: {error: e}, status: 500 
  end
  
  private 
    def company_params
      params.permit(:name, :address, :email, :logo)
    end
    
end