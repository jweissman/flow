class AddSummaryToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :summary, :text
  end
end
