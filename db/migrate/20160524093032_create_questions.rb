class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :position
      t.integer :orientation
      t.integer :size

      t.timestamps null: false
    end
  end
end
