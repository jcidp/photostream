require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get static_pages_view_url
    assert_response :success
  end

  test "should get show" do
    get static_pages_show_url
    assert_response :success
  end
end
