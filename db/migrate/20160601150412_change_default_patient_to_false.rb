class ChangeDefaultPatientToFalse < ActiveRecord::Migration
  def change
    change_column :users, :ophtalmo, :boolean, :default => false
  end
end
