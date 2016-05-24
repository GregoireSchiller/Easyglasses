class Question < ActiveRecord::Base
  has_many :user_answers
  validates :orientation, inclusion: { in: [1, 2, 3, 4] }
end
