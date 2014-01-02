class AddWorkerIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :worker_id, :string
  end
end
