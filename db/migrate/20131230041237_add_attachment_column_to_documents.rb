class AddAttachmentColumnToDocuments < ActiveRecord::Migration
  def self.up
    add_attachment :documents, :source
  end

  def self.down
    remove_attachment :documents, :source
  end
end
