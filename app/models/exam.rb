class Exam < ActiveRecord::Base
  belongs_to :patient, class_name: "User", foreign_key: :user_id

  has_one :prescription

  has_many :user_answers
  has_many :questions, through: :user_answers

  delegate :ophtalmo, to: :prescription

  validates :exam_date, presence: true
  validates :patient, presence: true
end
