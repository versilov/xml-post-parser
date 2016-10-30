class CreateBarcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :barcodes do |t|
      t.integer :inn
      t.integer :index
      t.integer :month
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
