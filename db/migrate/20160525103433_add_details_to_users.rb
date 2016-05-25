class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pregnant, :boolean
    add_column :users, :chronic_health_conditions, :boolean
    add_column :users, :current_pain, :boolean
    add_column :users, :eye_surgery, :boolean
    add_column :users, :gender, :string
    add_column :users, :wearing_on_now, :string
    add_column :users, :worn_in_past, :string
  end
end
