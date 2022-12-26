class VerificationEmailMailer < ApplicationMailer

  def verify_email(verify_email,email_code)
    @user=verify_email
    @code=email_code
    @url  = 'http://Devsloop.com/login'
    mail to: @user.email,subject: "Verify Email"
  end
end


