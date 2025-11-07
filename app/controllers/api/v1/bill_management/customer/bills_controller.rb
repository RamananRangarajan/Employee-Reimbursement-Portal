module Api 
    module V1 
      module BillManagement 
        module Admin 
          class BillsController < ApplicationController

            def index
                bills = Bill.where(user_id: current_user.id)
                render 'api/v1/bill_management/bills/index', locals: { bills: bills }
            end

            def create
                bill = Bill.create!(amount: params[:amount], bill_type: params[:bill_type], status: params[:status], user_id: current_user.id)
                render json: { success: true, message: 'Bill created successfully', bill: bill }, status: :created
            rescue => e
                render json: { success: false, message: e.message }, status: :unprocessable_entity
            end
          end
        end
      end
    end
end