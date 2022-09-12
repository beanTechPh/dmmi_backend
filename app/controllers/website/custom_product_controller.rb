class Website::CustomProductController < WebsiteController

  def show
    @product = CustomProduct.find_by(url_token: params[:id])
  rescue => e
    logger.info("\n\n\n\n #{e} \n\n\n\n")
    render status: 500  # invalid token
  end
  
end