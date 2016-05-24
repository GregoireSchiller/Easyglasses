class UserAnswer < ActiveRecord::Base
  belongs_to :question
  belongs_to :exam
  validates :answered_orientation, inclusion: { in: [1, 2, 3, 4] }
end
