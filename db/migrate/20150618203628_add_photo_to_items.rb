class AddPhotoToItems < ActiveRecord::Migration
  # changing migration contents to remove previous columns in order to resolve merge conflict.
  # These columns are recreated in a later migration.
  def change
    remove_column :items, :image_file_name,    :string
    remove_column :items, :image_content_type, :string
    remove_column :items, :image_file_size,    :integer
    remove_column :items, :image_updated_at,   :datetime
  end
end
