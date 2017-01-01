class RenameNewsItemsScopeColumnToZoom < ActiveRecord::Migration[5.0]
  def change
    rename_column :news_items, :scope, :zoom
  end
end
