class CreateNewsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :body
      t.text :body_preview
      t.date :unpin_date
      t.string :image_url
      t.string :preview_image_url
      t.boolean :approved, default: false
      t.integer :scope, default: 0

      t.timestamps
    end

    add_index :news_items, :scope
  end
end
