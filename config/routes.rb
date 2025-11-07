Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # Authentication routes

   get 'auth/login-customer', to: 'api/v1/auth_management/customer/auth#new'
   get 'auth/login-admin', to: 'api/v1/auth_management/admin/auth#new'

  namespace :api do
    namespace :v1 do
      namespace :auth_management do
        namespace :customer do
          post 'auth/login', to: 'auth#login'
          # get ''
        end

        namespace :admin do
          post 'auth/login', to: 'auth#login'
        end
      end

      namespace :employee_management  do
        namespace :admin do
          resources :employees
        end
      end

      namespace :bill_management  do
        namespace :admin do
          resources :bills
        end
        namespace :customer do
          resources :bills
        end
      end
    end
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
