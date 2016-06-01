class PrescriptionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.prescription_mailer.prescription.subject
  #
  def prescription(user)
    @user = user
    @ophtalmo = User.where(ophtalmo: true).first

    mail(to: @user.email, subject: 'Your prescription by EasyGlasses')
  end
end
