class ChangeDateColumnToDateTypeInRemainder < ActiveRecord::Migration[5.2]
  def change
  	change_column :remainders, :date, :date
  end
end
