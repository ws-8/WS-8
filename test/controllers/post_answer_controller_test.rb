require 'test_helper'

class PostAnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_answer_new_url
    assert_response :success
  end

end
