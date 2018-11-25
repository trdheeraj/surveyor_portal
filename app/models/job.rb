class Job < ApplicationRecord
	belongs_to :department
	belongs_to :insurance

	has_one :job_status
	has_many :document_receiveds
	has_many :expenses
	has_many :remainders
end