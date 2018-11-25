class CreateDepartment < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
    	t.string :name
    	t.timestamp
    end
  end
end
