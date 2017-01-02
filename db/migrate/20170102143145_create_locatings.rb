class CreateLocatings < ActiveRecord::Migration[5.0]
  def change
    create_table :locatings do |t|
      t.references :location, foreign_key: true
      t.references :locatable, polymorphic: true

      t.timestamps
    end

    add_index :locatings, [:locatable_type, :locatable_id, :location_id], unique: true, name: 'by_locatable_location'
  end
end
