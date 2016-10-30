class AddAttachmentXmlbarcodeToBarcodes < ActiveRecord::Migration
  def self.up
    change_table :barcodes do |t|
      t.attachment :xmlbarcode
    end
  end

  def self.down
    remove_attachment :barcodes, :xmlbarcode
  end
end
