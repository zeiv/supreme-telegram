require 'test_helper'

class ContactTest < ActionMailer::TestCase
  test "send_contact" do
    mail = Contact.send_contact
    assert_equal "Send contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
