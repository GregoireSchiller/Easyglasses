class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :show_size, :shoe_size
  end
end
