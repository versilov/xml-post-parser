class ChangeLimit < ActiveRecord::Migration[5.0]
  def change
    change_column :barcodes, :inn, :integer, limit: 8
  end
end
