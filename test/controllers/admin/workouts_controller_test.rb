require "test_helper"

class Admin::WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_workouts_show_url
    assert_response :success
  end
end
