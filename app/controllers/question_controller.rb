# frozen_string_literal: true

class QuestionController < ApplicationController
  before_action :lesson_and_course

  def index; end

  def new
    @question = Question.new(session[:question] || {})
  end

  def create
    @question = Question.new(question_params)
    # binding.pry
    if @question.save
      session[:question] = nil
      redirect_to question_list_path, notice: 'Posted Successfully!'
    else
      flash[:alert] = @question.errors
      session[:question] = @question.attributes.slice(*question_params.keys)
      redirect_to "/question/post_question/#{params[:id]}/new"
    end
  end

  def list
    @questions = Question.where(lesson_id: params[:id]).page(params[:page]).per(10)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id, :lesson_id)
  end

  def lesson_and_course
    @lesson = Lesson.find(params[:id])
    @course = Course.find(@lesson.course_id)
  end
end
