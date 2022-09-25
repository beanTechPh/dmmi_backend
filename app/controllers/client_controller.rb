class ClientController < ApplicationController
  before_action :authenticate_client_staff!
  before_action :set_current_user

  def set_current_user
    @current_user = current_client_staff
  end
end