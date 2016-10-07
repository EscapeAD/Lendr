require 'test_helper'

class MailboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mailboxes_index_url
    assert_response :success
  end

  test "should get show" do
    get mailboxes_show_url
    assert_response :success
  end

end
