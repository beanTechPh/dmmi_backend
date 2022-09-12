class Website::HomeController < WebsiteController
  def index
    @services = Service.where(is_top_service: true)
    @products = Product.where(is_top_product: true)
  end
end