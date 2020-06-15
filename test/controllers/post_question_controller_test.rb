require 'test_helper'

class PostQuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_question_new_url
    assert_response :success
  end

end
