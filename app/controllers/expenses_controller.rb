class ExpensesController < ApplicationController
	before_action :set_expense, only: [:edit, :update, :destroy]
	def index
		@expenses = Expense.paginate(page: params[:page], per_page: 10)
	end

	def list_of_expenses
		@expenses = Expense.where(job_id: params[:id]).paginate(page: params[:page], per_page: 10)
	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(expense_params)
		if @expense.save
			flash[:success] = "Expense was successfully created!!!"
			redirect_to expenses_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @expenses.update(expense_params)
			flash[:success] = "Expense was successfully edited!!!"
			redirect_to expenses_path
		else
			render 'edit'
		end
	end

	def destroy
		@expense.destroy
		flash[:danger] = "Expense was successfully deleted!!!"
		redirect_to expenses_path
	end

	private
		def set_expense
			@expense = Expense.find(params[:id])
		end

		def expense_params
			params.require(:expense).permit(:job_id, :description, :amount)
		end
end
