class Exam < ActiveRecord::Base
  belongs_to :user
  has_many :user_answers
  has_many :questions, through: :user_answers
  validates :exam_date, presence: true
  validates :user, presence: true
  validates :user, uniqueness: true
end
