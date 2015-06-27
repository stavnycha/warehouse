class CreateCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :categories_products, :id => false do |t|
      t.references :category
      t.references :product
    end
  end
end
