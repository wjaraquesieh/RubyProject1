require "test_helper"

class MakeupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get makeup_index_url
    assert_response :success
  end
end
