class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :patient_exams, :class_name => "Exam", dependent: :destroy
  has_many :patient_prescriptions, :class_name => "Prescription", through: :patient_exams, :source => :prescriptions
  has_many :ophtalmo_prescriptions, :class_name => "Prescription"
  has_many :ophtalmo_exams, :class_name => "Exam", through: :ophtalmo_prescriptions, source: :exam, dependent: :destroy
  has_one :review, dependent: :destroy
  validates :first_name, :last_name, :date_of_birth, :city, presence: true
  validates :email, uniqueness: true
end
