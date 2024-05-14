require "test_helper"

class Admin::StickersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_stickers_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_stickers_edit_url
    assert_response :success
  end
end
