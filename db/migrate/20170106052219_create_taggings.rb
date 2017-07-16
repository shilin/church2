class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :taggable, polymorphic: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    add_index :taggings, [:taggable_type, :taggable_id, :tag_id], unique: true, name: 'by_taggable_tag'
  end
end
