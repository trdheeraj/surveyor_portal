class DocumentReceivedsController < ApplicationController
	before_action :set_document_received, only: [:edit, :update, :destroy]
	def index
		@document_receiveds = DocumentReceived.paginate(page: params[:page], per_page: 10)
	end

	def new
		@document_received = DocumentReceived.new
	end

	def create
		@document_received = DocumentReceived.new(document_received_params)
		if @document_received.save
			flash[:success] = "DocumentReceived was successfully created!!!"
			redirect_to document_receiveds_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @document_received.update(document_received_params)
			flash[:success] = "DocumentReceived was successfully edited!!!"
			redirect_to document_receiveds_path
		else
			render 'edit'
		end
	end

	def destroy
		@document_received.destroy
		flash[:danger] = "DocumentReceived was successfully deleted!!!"
		redirect_to document_receiveds_path
	end

	private
		def set_document_received
			@document_received = DocumentReceived.find(params[:id])
		end

		def document_received_params
			params.require(:document_received).permit(:job_id, :date)
		end
end
