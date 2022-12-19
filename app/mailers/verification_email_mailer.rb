class VerificationEmailMailer < ApplicationMailer

  def verify_email(verify_email)
    @user=verify_email
    @url  = 'http://Devsloop.com/login'
    mail to: @user.email,subject: "Verify Email"
  end
end


