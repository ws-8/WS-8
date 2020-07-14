class PostAnswerController < ApplicationController
  def new
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @lesson = Lesson.find(@question.lesson_id)
    @course = Course.find(@lesson.course_id)
  end

  def create
    @answer = Answer.new
    # binding.pry
    if @answer.save
      redirect_to question_detail_path, notice: 'Posted Successfully!'
    else
      flash[:alert] = @answer.errors
      redirect_to question_list_path
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end
end
