class JobStatus < ApplicationRecord
	belongs_to :job

	validates_uniqueness_of :job_id
end