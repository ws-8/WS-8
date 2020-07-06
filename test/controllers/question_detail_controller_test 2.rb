require 'test_helper'

class QuestionDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get question_detail_index_url
    assert_response :success
  end

end
