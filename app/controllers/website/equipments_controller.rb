class Website::EquipmentsController < WebsiteController
  
  def show
    @equipment = Equipment.find_by(url_code: params[:id])
  end
end