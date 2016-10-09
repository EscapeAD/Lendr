require 'test_helper'

class MailboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mailboxes_url
    assert_response :success
  end

  test "should get show" do
    get mailbox_url
    assert_response :success
  end

end
