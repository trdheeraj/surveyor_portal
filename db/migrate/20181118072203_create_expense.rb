class CreateExpense < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
    	t.references :job, index: true
    	t.string :description
    	t.decimal :amount
    	t.timestamp
    end
  end
end
