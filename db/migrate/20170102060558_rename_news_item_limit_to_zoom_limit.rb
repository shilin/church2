class RenameNewsItemLimitToZoomLimit < ActiveRecord::Migration[5.0]
  def change
    rename_table :news_item_limits, :zoom_limits
  end
end
