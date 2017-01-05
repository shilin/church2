class CreatePhonings < ActiveRecord::Migration[5.0]
  def change
    create_table :phonings do |t|
      t.references :phonable, polymorphic: true
      t.references :phone, foreign_key: true

      t.timestamps
    end

    add_index :phonings, [:phonable_id, :phonable_type, :phone_id], unique: true, name: 'by_phonable_phone'
  end
end
