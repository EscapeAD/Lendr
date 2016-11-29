require 'test_helper'

class MailboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mailboxes_path
    assert_response :success
  end

  test "should get show" do
    get mailbox_path
    assert_response :success
  end

end
