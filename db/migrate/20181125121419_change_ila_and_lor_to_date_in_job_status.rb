class ChangeIlaAndLorToDateInJobStatus < ActiveRecord::Migration[5.2]
  def change
  	change_column :job_statuses, :ila_date, :date
  	change_column :job_statuses, :lor_date, :date
  	remove_column :job_statuses, :ila
  	remove_column :job_statuses, :lor
  end
end
