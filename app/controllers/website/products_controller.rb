class Website::ProductsController < WebsiteController
  def index
    @products = Product.all
  end
  
  def update
    product = Product.find(params[:id])

    if product.update!(product_params)
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
  
  private 
    def product_params
      params.permit(:name, :image, :product_category_id, :raw_material, :coating, :color, :application, :usage)
    end
    
end