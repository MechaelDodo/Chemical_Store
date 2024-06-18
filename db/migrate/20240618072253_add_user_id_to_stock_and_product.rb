class AddUserIdToStockAndProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :stocks, :user, null: false, foreign_key: true, default: true
    add_reference :products, :user, null: false, foreign_key: true, default: true
  end
end
