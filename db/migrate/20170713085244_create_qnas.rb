class CreateQnas < ActiveRecord::Migration[5.0]
  def change
    create_table :qnas do |t|
      t.string :name
      t.text :question
      t.text :answer
      t.boolean :approved, default: false

      t.timestamps
    end
    add_index :qnas, :approved
  end
end
