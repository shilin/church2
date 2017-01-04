class CreateAddressings < ActiveRecord::Migration[5.0]
  def change
    create_table :addressings do |t|
      t.references :addressable, polymorphic: true
      t.references :address, foreign_key: true

      t.timestamps
    end

  add_index :addressings, [:addressable_type, :addressable_id, :address_id], unique: true, name: 'by_addressable_address'
  end
end
