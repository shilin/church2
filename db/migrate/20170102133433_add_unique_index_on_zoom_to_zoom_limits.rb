class AddUniqueIndexOnZoomToZoomLimits < ActiveRecord::Migration[5.0]
  def change
    add_index :zoom_limits, :zoom, unique: true
  end
end
