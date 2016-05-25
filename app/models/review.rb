class Review < ActiveRecord::Base
  belongs_to :user
  validates :rating, :description, presence: true
  validates :user, presence: true
  validates :user, uniqueness: true
  validates :description, :length => {
    :minimum   => 5,
    :maximum   => 100,
    :tokenizer => lambda { |str| str.scan(/\s+|$/) },
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
