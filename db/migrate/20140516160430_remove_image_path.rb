class RemoveImagePath < ActiveRecord::Migration
  def change
  	remove_column :books, :image_path
  end
end
