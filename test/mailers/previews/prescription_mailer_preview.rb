class PrescriptionMailerPreview < ActionMailer::Preview
  def prescription
    user = User.first
    PrescriptionMailer.prescription(user)
  end
end
