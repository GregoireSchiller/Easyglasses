class AddOphtalmoToUser < ActiveRecord::Migration
  def change
    add_column :users, :ophtalmo, :boolean
  end
end
