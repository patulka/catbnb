require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cats_new_url
    assert_response :success
  end

  test "should get create" do
    get cats_create_url
    assert_response :success
  end

end
