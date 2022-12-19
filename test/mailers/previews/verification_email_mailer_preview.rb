# Preview all emails at http://localhost:3000/rails/mailers/verification_email_mailer
class VerificationEmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/verification_email_mailer/verify_email
  def verify_email
    VerificationEmailMailer.verify_email
  end

end
