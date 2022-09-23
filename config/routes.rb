Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :client do
    mount_devise_token_auth_for 'Staff', at: 'staff_auth'

    resources :equipments
  end

  namespace :admin do
    mount_devise_token_auth_for 'Admin', at: 'admin_auth'

    resources :equipments do
      collection do
        get 'new', to: "equipments#new"
      end
    end

    resources :admins
  end

  namespace :website, path: '', defaults: {format: :json} do
    resources :home, only: [:index]
    resources :products
    resources :services
    resources :contact, only: [:create]
    resources :custom_product, only: [:show]
    resources :equipments, only: [:show]
  end
end
