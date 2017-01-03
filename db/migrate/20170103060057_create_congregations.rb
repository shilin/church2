class CreateCongregations < ActiveRecord::Migration[5.0]
  def change
    create_table :congregations do |t|
      t.string :name
      t.text :about
      t.text :schedule

      t.timestamps
    end
  end
end
