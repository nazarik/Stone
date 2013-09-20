class AddAttachmentToProductsAndCategories < ActiveRecord::Migration
  def change
    add_attachment :products, :image
    add_attachment :categories, :image
  end
end
