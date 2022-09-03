class ClientController < ApplicationController
  before_action :authenticate_client_staff!
end