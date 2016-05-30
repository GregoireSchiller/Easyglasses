class Prescription < ActiveRecord::Base
  belongs_to :exam
  belongs_to :ophtalmo, :class_name => "User", :foreign_key => :user_id
  delegate :patient, to: :exam
end
