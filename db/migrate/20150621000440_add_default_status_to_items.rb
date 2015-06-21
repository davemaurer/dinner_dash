class AddDefaultStatusToItems < ActiveRecord::Migration
  def change
    change_column :items, :status, :string, :default => "active"
  end
end
