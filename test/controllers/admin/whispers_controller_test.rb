require "test_helper"

class Admin::WhispersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_whispers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_whispers_show_url
    assert_response :success
  end
end
