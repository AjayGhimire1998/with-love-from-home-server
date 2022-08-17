require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get store_name_url
    assert_response :success
  end

  test "should get category_id:foreign_key" do
    get store_category_id:foreign_key_url
    assert_response :success
  end

  test "should get logo" do
    get store_logo_url
    assert_response :success
  end
end
