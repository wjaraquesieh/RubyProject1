class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.string :currency
      t.string :image
      t.string :link
      t.text :description
      t.float :rating
      t.references :product_type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
