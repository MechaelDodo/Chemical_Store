class CreateProductStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :product_stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
