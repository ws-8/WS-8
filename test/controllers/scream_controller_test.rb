require 'test_helper'

class ScreamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scream_index_url
    assert_response :success
  end

end
