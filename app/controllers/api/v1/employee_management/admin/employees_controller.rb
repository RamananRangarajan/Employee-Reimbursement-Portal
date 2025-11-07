module Api 
  module V1 
    module EmployeeManagement 
      module Admin 
        class EmployeesController < ApplicationController
          before_action :doorkeeper_authorize!

          def new
            @employee = User.new
          end

          def index
            users = User.all
            render 'employees/admin_index', locals: { users: users }
          end

          def create
            user = User.create!(email:  params[:user][:email], role: "employee", password: SecureRandom.hex(10))
            EmployeeDetail.create!(first_name:  params[:user][:first_name] , last_name:  params[:user][:last_name] ,
                           designation:  params[:user][:designation] , department_id: Department.find_by(name:  params[:user][:department]).id,
                           user_id: user.id)
            redirect_to api_v1_employee_management_admin_employees_path, notice: 'Employee created successfully'
          rescue => e
            puts e.message
            render :new
          end
        end
      end
    end
  end
end