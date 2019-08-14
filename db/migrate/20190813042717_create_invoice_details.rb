class CreateInvoiceDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_details do |t|
      t.references :invoice, foreign_key: true
      t.integer :product_id
      t.integer :quantity_order
      t.integer :price_each
      t.timestamps
    end
  end
end
