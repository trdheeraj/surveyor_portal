class CreateJobStatus < ActiveRecord::Migration[5.2]
  def change
    create_table :job_statuses do |t|
    	t.references :job, index: true
    	t.boolean :ila
    	t.datetime :ila_date
    	t.boolean :lor
    	t.datetime :lor_date
    	t.timestamp
    end
  end
end
