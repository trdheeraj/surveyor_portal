class ChangeDoiAndDolToDateInJobs < ActiveRecord::Migration[5.2]
  def change
  	change_column :jobs, :doi, :date
  	change_column :jobs, :dol, :date
  end
end
