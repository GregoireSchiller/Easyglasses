class AddReferenceToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :exam_id, :integer
    add_column :prescriptions, :user_id, :integer
  end
end
