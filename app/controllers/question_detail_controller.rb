class QuestionDetailController < ApplicationController
  def index
    # get question
    q_id = params[:question_id]
    @question = Question.find(q_id)
    q_user_id = @question.user_id

    # get lesson number
    l_id = @question.lesson_id
    @lesson = Lesson.find(l_id)

    # get course_name
    c_id = @lesson.course_id
    @course = Course.find(c_id)

    # get user name (who post question)
    @user = User.find(q_user_id)

    # get answers
    @answers = Answer.where(question_id: q_id)
  end

  def authorized
    @answer=Answer.find(params[:id])
    @answer.authorized=true
    @answer.save
    redirect_back(fallback_location: root_path)
  end
  def solved
    @question=Question.find(params[:id])
    @question.solved=true
    @question.save
    redirect_back(fallback_location: root_path)
  end
end
