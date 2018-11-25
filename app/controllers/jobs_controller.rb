class JobsController < ApplicationController
	before_action :set_job, only: [:edit, :update, :destroy, :add_gross_loss, :new_gross_loss]
	def index
		@jobs = Job.paginate(page: params[:page], per_page: 5)
		generate_report_number_and_bill_number if params[:job_id]
	end

	def new
		@job = Job.new
	end

	def edit
	end

	def create
		@job = Job.new(job_params)
		@job.job_number = Job.maximum(:job_number).to_i + 1
		if @job.save
			flash[:success] = "Job was successfully created!!!"
			redirect_to jobs_path
		else
			render 'new'
		end
	end

	def update
		if @job.update(job_params)
			flash[:success] = "Job was successfully edited!!!"
			redirect_to jobs_path
		else
			render 'edit'
		end
	end

	def destroy
		@job.destroy
		flash[:danger] = "Job was successfully deleted!!!"
		redirect_to jobs_path
	end

	def generate_report_number_and_bill_number
		@job = Job.find(params[:job_id])
		report_number = Job.maximum(:report_number).to_i + 1 if params[:report_number]
		report_number = @job.report_number ? @job.report_number : report_number
		bill_number = Job.maximum(:bill_number).to_i + 1 if params[:bill_number]
		bill_number = @job.bill_number ? @job.bill_number : bill_number
		if @job.update(report_number: report_number, bill_number: bill_number)
			flash[:success] = "Report Number and Bill Number was successfully created!!!"
		else
			flash[:error] = "Report Number and Bill Number was not successfully created!!!"
		end
		redirect_to jobs_path
	end

	def new_gross_loss
	end

	def add_gross_loss
		if @job.update_attribute(job_params)
			flash[:success] = "Gross loss was successfully edited!!!"
		else
			flash[:error] = "Gross loss was not successfully edited!!!"
		end
		redirect_to jobs_path
	end

	private
		def set_job
			@job = Job.find(params[:id])
		end

		def job_params
			params.require(:job).permit(:job_number, :department_id, :insurance_id, :customer_name, :description, :branch, :state, :appointed_by,
				:dol, :doi, :status, :all_documents_received, :gross_loss)
		end
end
