class AddFieldsToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :ophtalmo_score_left, :string
    add_column :prescriptions, :ophtalmo_score_right, :string
  end
end
