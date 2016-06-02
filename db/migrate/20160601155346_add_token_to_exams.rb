class AddTokenToExams < ActiveRecord::Migration
  def change
    add_column :exams, :token, :string
  end
end
