class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exams, dependent: :destroy
  has_one :review, dependent: :destroy
  validates :first_name, :last_name, :date_of_birth, :city, presence: true
  validates :email, uniqueness: true
  validate :date_of_birth_after_1900

  def date_of_birth_after_1900
    if date_of_birth.year < 1900
      errors.add(:date_of_birth, 'you are too old')
    end
  end

  # , inclusion: { in: 1900..Date.today.year, message: "you are too old" }
end
