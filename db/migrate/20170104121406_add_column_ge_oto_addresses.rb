class AddColumnGeOtoAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :geo, :boolean, default: false
  end
end
