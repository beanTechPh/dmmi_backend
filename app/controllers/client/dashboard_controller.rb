class Client::DashboardController < ClientController
  
  def index
    render status: 200
  end
  
  def sidebar
    @company = @current_user.company

    render status: 200
  end
  
end