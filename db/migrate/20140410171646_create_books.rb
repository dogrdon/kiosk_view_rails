class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :creator
      t.string :publisher
      t.string :year
      t.string :image_path
      t.binary :thumb

      t.timestamps
    end
  end
end
