require "test_helper"

class Public::WhisperBookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_whisper_bookmarks_index_url
    assert_response :success
  end
end
