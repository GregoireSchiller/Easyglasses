class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.date :exam_date
      t.integer :score_right
      t.integer :score_left
      t.integer :score_total
      t.string :recommendation
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
