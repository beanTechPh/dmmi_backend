Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :client do
    mount_devise_token_auth_for 'Staff', at: 'staff_auth'

    resources :equipments
    resources :dashboard do
      collection do
        get :sidebar
      end
    end
    resources :companies, only: [:create] do
      collection do
        get :profile
      end
    end
    resources :staffs
    resources :inquiries do
      collection do
        post :tech_support
      end
    end
    resources :messages
    resources :orders
  end

  namespace :admin do
    mount_devise_token_auth_for 'Admin', at: 'admin_auth'

    resources :equipments do
      collection do
        get 'new', to: "equipments#new"
        post :update_details
      end
    end

    resources :admins
    resources :inquiries
    resources :messages
    resources :contacts
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
