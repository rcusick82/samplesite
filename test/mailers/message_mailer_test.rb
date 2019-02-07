require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  # test "contact_me" do
  #   mail = MessageMailer.contact_me
  #   assert_equal "Contact me", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end
  test "contact_me" do
    message = Message.new name: 'anna',
                          email: 'anna@example.org',
                          body: 'hello, how are you doing?'

    email = MessageMailer.contact_me(message)

    assert_emails 1 do
      email.deliver_now
    end

    # assert_equal 'Message test', email.subject
    assert_equal ['rcusick82@gmail.com'], email.to
    assert_equal ['anna@example.org'], email.from
    assert_match /hello, how are you doing?/, email.body.encoded
  end
end
