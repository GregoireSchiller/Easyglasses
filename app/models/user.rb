class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exams, dependent: :destroy
  has_one :review, dependent: :destroy
  validates :first_name, :last_name, :date_of_birth, :city, presence: true
  validates :email, uniqueness: true
end
