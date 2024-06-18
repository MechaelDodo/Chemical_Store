class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :regular, :boolean, default: true
    add_column :users, :worker, :boolean, default: false
    add_column :users, :cashier, :boolean, default: false
  end
end
