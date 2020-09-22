require 'test_helper'

class LessonFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_file = lesson_files(:one)
  end

  test "should get index" do
    get lesson_files_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_file_url
    assert_response :success
  end

  test "should create lesson_file" do
    assert_difference('LessonFile.count') do
      post lesson_files_url, params: { lesson_file: { comment: @lesson_file.comment, filename: @lesson_file.filename, title: @lesson_file.title } }
    end

    assert_redirected_to lesson_file_url(LessonFile.last)
  end

  test "should show lesson_file" do
    get lesson_file_url(@lesson_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_file_url(@lesson_file)
    assert_response :success
  end

  test "should update lesson_file" do
    patch lesson_file_url(@lesson_file), params: { lesson_file: { comment: @lesson_file.comment, filename: @lesson_file.filename, title: @lesson_file.title } }
    assert_redirected_to lesson_file_url(@lesson_file)
  end

  test "should destroy lesson_file" do
    assert_difference('LessonFile.count', -1) do
      delete lesson_file_url(@lesson_file)
    end

    assert_redirected_to lesson_files_url
  end
end
