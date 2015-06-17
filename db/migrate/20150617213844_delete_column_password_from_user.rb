class DeleteColumnPasswordFromUser < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :role
    add_column :users, :role, :integer, default: 0
  end
end
