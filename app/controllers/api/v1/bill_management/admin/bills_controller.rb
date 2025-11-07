module Api 
    module V1 
      module BillManagement 
        module Admin 
          class BillsController < ApplicationController

            def index
                bills = Bill.all
                render 'api/v1/bill_management/bills/index', locals: { bills: bills }
            end

            def update
                bill = Bill.find(params[:id])
                raise 'Bill not found' if bill.nil?
                bill.update!(status: params[:status])
                render json: { success: true, message: 'Bill updated successfully', bill: bill }, status: :ok
            rescue => e
                render json: { success: false, message: e.message }, status: :unprocessable_entity
            end
          end
        end
      end
    end
end