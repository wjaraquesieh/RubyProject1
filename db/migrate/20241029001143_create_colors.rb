class CreateColors < ActiveRecord::Migration[7.2]
  def change
    create_table :colors do |t|
      t.string :hex_value
      t.string :colorName

      t.timestamps
    end
  end
end
