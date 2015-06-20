class AddDefaultAndCurrencyToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :total_price, :decimal, precision: 5, scale: 2
    change_column :orders, :status, :string, :default => "ordered" 
  end
end
