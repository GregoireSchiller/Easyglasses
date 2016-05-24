class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :answered_orientation
      t.references :question, index: true, foreign_key: true
      t.references :exam, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
