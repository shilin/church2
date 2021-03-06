class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
    add_index :categories, :name, unique: true
    add_index :categories, :color, unique: true
  end
end
