class PrescriptionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.prescription_mailer.prescription.subject
  #
  def prescription(prescription_id)
    @prescription = Prescription.find(prescription_id)
    @user = @prescription.patient
    @ophtalmo = @prescription.ophtalmo
    attachments["prescription_#{@user.first_name}_#{@user.last_name}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: "prescription_#{@user.first_name}_#{@user.last_name}", template: 'prescriptions/pdf_prescription.html.erb', layout: false), {}
    )
    mail(to: @user.email, subject: 'Your prescription by EasyGlasses')
  end
end
