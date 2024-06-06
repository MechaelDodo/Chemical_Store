class AddColumnAmountToProductStocks < ActiveRecord::Migration[7.0]
  def change
    add_column :product_stocks, :amount, :integer, default: 0
  end
end
