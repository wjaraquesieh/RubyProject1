class CreateProductColors < ActiveRecord::Migration[7.2]
  def change
    create_table :product_colors do |t|
      t.references :product, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
