class CreateRemainder < ActiveRecord::Migration[5.2]
  def change
    create_table :remainders do |t|
    	t.references :job, index: true
    	t.datetime :date
    	t.timestamp
    end
  end
end
