class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.references :category

      t.timestamps
    end
    add_index :products, :category_id
  end
end
