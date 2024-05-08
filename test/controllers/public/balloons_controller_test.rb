require "test_helper"

class Public::BalloonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_balloons_new_url
    assert_response :success
  end

  test "should get show" do
    get public_balloons_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_balloons_edit_url
    assert_response :success
  end
end
