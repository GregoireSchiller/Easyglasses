class Exam < ActiveRecord::Base
  belongs_to :patient, :class_name => "User", :foreign_key => :user_id
  has_one :prescription
  delegate :ophtalmo, to: :prescription
  has_many :user_answers
  has_many :questions, through: :user_answers
  validates :exam_date, presence: true
  validates :user, presence: true
end
