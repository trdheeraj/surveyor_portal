class Job < ApplicationRecord
	belongs_to :department
	belongs_to :insurance

	has_one :job_status
	has_many :document_received
	has_many :expense
	has_many :remainder
end