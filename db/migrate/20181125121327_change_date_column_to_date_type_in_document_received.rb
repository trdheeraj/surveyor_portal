class ChangeDateColumnToDateTypeInDocumentReceived < ActiveRecord::Migration[5.2]
  def change
  	change_column :document_receiveds, :date, :date
  end
end
