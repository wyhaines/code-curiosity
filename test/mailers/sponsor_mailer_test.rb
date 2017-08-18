require "test_helper"

class SponsorMailerTest < ActionMailer::TestCase
  test "whenever subscription is created mailer must send mail to user and admin" do
    user = create :user
    s = create :sponsorer_detail, payment_plan: "base", user: user
    s.send :notify_user_and_admin
    assert_enqueued_jobs 2
  end
end
