class DepartmentsController < ApplicationController
	before_action :set_department, only: [:edit, :update, :destroy]
	def index
		@departments = Department.paginate(page: params[:page], per_page: 5)
	end

	def new
		@department = Department.new
	end

	def create
		@department = Department.new(department_params)
		if @department.save
			flash[:success] = "Department was successfully created!!!"
			redirect_to departments_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @department.update(department_params)
			flash[:success] = "Department was successfully edited!!!"
			redirect_to departments_path
		else
			render 'edit'
		end
	end

	def destroy
		@department.destroy
		flash[:danger] = "Department was successfully deleted!!!"
		redirect_to departments_path
	end

	private
		def set_department
			@department = Department.find(params[:id])
		end

		def department_params
			params.require(:department).permit(:name)
		end
end
