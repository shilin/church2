class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.text :body
      t.boolean :postal, default: false

      t.timestamps
    end

    add_index :addresses, :name, unique: true
  end
end
