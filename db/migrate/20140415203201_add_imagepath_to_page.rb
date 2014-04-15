class AddImagepathToPage < ActiveRecord::Migration
  def change
    add_column :pages, :image_path, :string
  end
end
