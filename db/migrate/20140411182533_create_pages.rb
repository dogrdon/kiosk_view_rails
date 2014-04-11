class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.binary :file
      t.text :comment
      t.string :page_num
      t.references :book, index: true

      t.timestamps
    end
  end
end
