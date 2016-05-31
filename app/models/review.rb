class Review < ActiveRecord::Base
  belongs_to :patient, :class_name => "User", :foreign_key => :user_id
  validates :rating, :description, presence: true
  validates :patient, presence: true
  validates :patient, uniqueness: true
  validates :description, :length => {
    :minimum   => 5,
    :maximum   => 100,
    :tokenizer => lambda { |str| str.scan(/\s+|$/) },
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
