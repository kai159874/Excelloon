require "test_helper"

class Admin::BalloonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_balloons_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_balloons_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_balloons_edit_url
    assert_response :success
  end
end
