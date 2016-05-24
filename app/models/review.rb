class Review < ActiveRecord::Base
  belongs_to :user
  validates :rating, :description, presence: true
  validates :user, presence: true
  validates :user, uniqueness: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
