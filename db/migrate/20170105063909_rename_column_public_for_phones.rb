class RenameColumnPublicForPhones < ActiveRecord::Migration[5.0]
  def change
    rename_column :phones, :public, :for_public
  end
end
