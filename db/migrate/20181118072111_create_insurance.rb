class CreateInsurance < ActiveRecord::Migration[5.2]
  def change
    create_table :insurances do |t|
    	t.string :name
    	t.string :gst_number
    	t.string :location
    	t.timestamp
    end
  end
end
