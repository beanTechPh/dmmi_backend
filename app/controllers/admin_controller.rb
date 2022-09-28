class AdminController < ApplicationController
  before_action :authenticate_admin_admin!
  before_action :set_current_user

  def set_current_user
    @current_user = current_admin_admin
  end
end