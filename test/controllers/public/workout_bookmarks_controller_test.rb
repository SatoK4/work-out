require "test_helper"

class Public::WorkoutBookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_workout_bookmarks_index_url
    assert_response :success
  end
end
