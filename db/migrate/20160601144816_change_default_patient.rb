class ChangeDefaultPatient < ActiveRecord::Migration
  def change
    change_column :users, :ophtalmo, :boolean, :default => true
  end
end
