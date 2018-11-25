class CreateDocumentReceived < ActiveRecord::Migration[5.2]
  def change
    create_table :document_receiveds do |t|
    	t.references :job, index: true
    	t.datetime :date
    	t.timestamp
    end
  end
end
