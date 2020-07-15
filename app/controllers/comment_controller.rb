class CommentController < ApplicationController
  def new
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
    @user = User.find(@question.user_id)
    @ans_user = User.find(@answer.user_id)
    @lesson = Lesson.find(@question.lesson_id)
    @course = Course.find(@lesson.course_id)
  end

  def create
    @comment = Comment.new(comment_params)
    @answer=Answer.find(@comment.answer_id)
    
    # binding.pry
    if @comment.save
      redirect_to question_detail_path(question_id: @answer.question_id), notice: 'Posted Successfully!'
    else
      flash[:alert] = @comment.errors
      redirect_to new_comment_path
    end
  end

  private
  def comment_params
    params.permit(:body, :user_id, :answer_id)
  end
end
