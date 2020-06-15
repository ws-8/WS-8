require 'test_helper'

class UsertopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get usertop_index_url
    assert_response :success
  end

end
