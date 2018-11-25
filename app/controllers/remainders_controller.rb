class RemaindersController < ApplicationController
	before_action :set_remainder, only: [:edit, :update, :destroy]
	def index
		@remainders = Remainder.paginate(page: params[:page], per_page: 10)
	end

	def new
		@remainder = Remainder.new
	end

	def create
		@remainder = Remainder.new(remainder_params)
		if @remainder.save
			flash[:success] = "Remainder was successfully created!!!"
			redirect_to remainders_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @remainder.update(remainder_params)
			flash[:success] = "Remainder was successfully edited!!!"
			redirect_to remainders_path
		else
			render 'edit'
		end
	end

	def destroy
		@remainder.destroy
		flash[:danger] = "Remainder was successfully deleted!!!"
		redirect_to remainders_path
	end

	private
		def set_remainder
			@remainder = Remainder.find(params[:id])
		end

		def remainder_params
			params.require(:remainder).permit(:job_id, :date)
		end
end
