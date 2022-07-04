require 'test_helper'

class ListControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get list_create_url
    assert_response :success
  end

  test "should get update" do
    get list_update_url
    assert_response :success
  end

  test "should get destroy" do
    get list_destroy_url
    assert_response :success
  end

end
