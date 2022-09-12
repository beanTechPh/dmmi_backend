class Website::ServicesController < WebsiteController
  def index
    @services = Service.all
  end
  
end