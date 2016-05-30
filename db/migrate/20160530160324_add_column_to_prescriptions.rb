class AddColumnToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :status, :string, default: "Pending"
  end
end
