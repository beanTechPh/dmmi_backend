Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :client do
    mount_devise_token_auth_for 'Staff', at: 'staff_auth'
    resources :equipments
  end
end
