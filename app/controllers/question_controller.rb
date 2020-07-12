class QuestionController < ApplicationController
  def index
  end

  def list
    @lesson=Lesson.find(params[:id])
    @questions=(Question.where(lesson_id:params[:id])).page(params[:page]).per(10)
    @course=Course.find(@lesson.course_id)
  end
end
