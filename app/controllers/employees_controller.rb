class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if Employee.all.find{ |emp| emp.alias == @employee.alias }
            puts "That alias is taken!"
            sleep(3)
            redirect_to new_employee_path(@employee)
        elsif Employee.all.find{ |emp| emp.title == @employee.title }
            puts "That title is taken!"
            sleep(3)
            redirect_to new_employee_path(@employee)
        else
            @employee.save
            redirect_to employee_path(@employee)
        end 
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if Employee.all.find{ |emp| emp.alias == @employee.alias }
            puts "That alias is taken!"
            sleep(3)
            redirect_to edit_employee_path(@employee)
        elsif Employee.all.find{ |emp| emp.title == @employee.title }
            puts "That title is taken!"
            sleep(3)
            redirect_to edit_employee_path(@employee)
        else
            @employee.update(employee_params)
            redirect_to employee_path(@employee)
        end 
    end

    def delete

    end 

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
