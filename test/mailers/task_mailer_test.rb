# frozen_string_literal: true

require "test_helper"

class TaskMailerTest < ActionMailer::TestCase
  def setup
    @user = create(:user)
  end

  def test_task_mailer_is_delivering_mails
    email = TaskMailer.pending_tasks_email(@user.id).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["no-reply@granite.com"], email.from
    assert_equal [@user.email], email.to
    assert_equal "Pending Tasks", email.subject
  end
end
