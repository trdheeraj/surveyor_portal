class InsurancesController < ApplicationController
	before_action :set_insurance, only: [:edit, :update, :destroy]
	def index
		@insurances = Insurance.paginate(page: params[:page], per_page: 10)
	end

	def new
		@insurance = Insurance.new
	end

	def create
		@insurance = Insurance.new(insurance_params)
		if @insurance.save
			flash[:success] = "Insurance was successfully created!!!"
			redirect_to insurances_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @insurance.update(insurance_params)
			flash[:success] = "Insurance was successfully edited!!!"
			redirect_to insurances_path
		else
			render 'edit'
		end
	end

	def destroy
		@insurance.destroy
		flash[:danger] = "Insurance was successfully deleted!!!"
		redirect_to insurances_path
	end

	private
		def set_insurance
			@insurance = Insurance.find(params[:id])
		end

		def insurance_params
			params.require(:insurance).permit(:name, :gst_number, :location)
		end
end
