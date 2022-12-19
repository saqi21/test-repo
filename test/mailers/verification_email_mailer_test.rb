require 'test_helper'

class VerificationEmailMailerTest < ActionMailer::TestCase
  test "verify_email" do
    mail = VerificationEmailMailer.verify_email
    assert_equal "Verify email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
