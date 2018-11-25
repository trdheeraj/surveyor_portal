class CreateJob < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
    	t.string :job_number
    	t.references :department, index: true
    	t.references :insurance, index: true
    	t.string :customer_name
    	t.text :description
    	t.string :branch
    	t.string :state
    	t.string :appointed_by
    	t.datetime :dol
    	t.datetime :doi
    	t.string :status
    	t.boolean :all_documents_received
    	t.decimal :gross_loss
    	t.integer :report_number
    	t.integer :bill_number
    	t.timestamp
    end
  end
end
