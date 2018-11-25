class JobStatusesController < ApplicationController
	before_action :set_job_status, only: [:edit, :update, :destroy]
	def index
		@job_statuses = JobStatus.paginate(page: params[:page], per_page: 10)
	end

	def new
		@job_status = JobStatus.new
	end

	def create
		@job_status = JobStatus.new(job_status_params)
		if @job_status.save
			flash[:success] = "Job status was successfully created!!!"
			redirect_to job_statuses_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @job_status.update(job_status_params)
			flash[:success] = "Job status was successfully edited!!!"
			redirect_to job_statuses_path
		else
			render 'edit'
		end
	end

	def destroy
		@job_status.destroy
		flash[:danger] = "Job status was successfully deleted!!!"
		redirect_to job_statuses_path
	end

	private
		def set_job_status
			@job_status = JobStatus.find(params[:id])
		end

		def job_status_params
			params.require(:job_status).permit(:job_id, :ila_date, :lor_date)
		end
end
