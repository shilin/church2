class CreateClergymen < ActiveRecord::Migration[5.0]
  def change
    create_table :clergymen do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :rank
      t.date :birth
      t.date :engagement
      t.date :wedding
      t.date :baptism
      t.date :confirmation
      t.date :deacon_ordination
      t.date :pastor_ordination
      t.date :bishop_installation

      t.timestamps
    end
  end
end
