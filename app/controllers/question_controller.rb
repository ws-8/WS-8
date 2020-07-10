class QuestionController < ApplicationController
  def index
  end

  def list
    @lesson=Lesson.find(params[:id])
    @questions=Question.where(lesson_id:params[:id])
    @course=Course.find(@lesson.course_id)
  end
end
