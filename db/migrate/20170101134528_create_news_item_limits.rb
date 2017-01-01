class CreateNewsItemLimits < ActiveRecord::Migration[5.0]
  def change
    create_table :news_item_limits do |t|
      t.integer :zoom, default: 0
      t.integer :limit

      t.timestamps
    end
  end
end
