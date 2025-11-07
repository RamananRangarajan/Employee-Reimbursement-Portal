module Api 
  module V1 
    module AuthManagement 
      module Customer 
        class AuthController < ApplicationController
         
          def new
             render template: 'auth/login_customer'
          end

          def login
            user = User.authenticate(params[:email], params[:password])
            if user && user.employee?
              access_token = create_access_token(user)
              render json: { 
                success: true, 
                message: 'Login successful',
                token: access_token.token,
                redirect_url: api_v1_bill_management_customer_bills_path
              }, status: :ok
            else
              render json: { 
                success: false, 
                message: 'Invalid email or password' 
              }, status: :unauthorized
            end

          end

          private

          def create_access_token
             Doorkeeper::AccessToken.create!(
                resource_owner_id: user.id,
                expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
                scopes: 'public'
              )
          end
        end
      end
    end
  end
end