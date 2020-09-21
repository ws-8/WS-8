# frozen_string_literal: true
require 'net/https'
require 'uri'
require 'json'


class QuestionController < ApplicationController
  include SessionsHelper
  def index; end

  def new
    # get hypothesis json data
    @hypaccount = current_user.hypaccount
    @items = nil
    if !@hypaccount.nil?
      @items = get_json(@hypaccount)["rows"]
    end

    # set question information
    @lesson = Lesson.find(params[:id])
    @course = Course.find(@lesson.course_id)
    @question = Question.new
    @array = Bar.where(lesson_id: params[:id])
    @pages = @array.pluck(:page)
    # binding.pry

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
    @question = Question.new(question_params)
    # binding.pry
    if params[:submit] == 'preview'
      render :action => 'new'
    elsif @question.save
      redirect_to question_list_path, notice: 'Posted Successfully!'
    else
      flash[:alert] = @question.errors
      redirect_to "/question/post_question/#{params[:id]}/new"
    end
  end

  def list
    @lesson = Lesson.find(params[:id])
    @questions = Question.where(lesson_id: params[:id]).page(params[:page]).per(10)
    @course = Course.find(@lesson.course_id)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id, :lesson_id, :page)
  end

  def get_json(account)
    uri_base = 'https://api.hypothes.is/api/search?user=acct:' + account + '@hypothes.is'
    uri = URI.parse(uri_base)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(req)
    puts res.code, res.msg
    api_response = JSON.parse(res.body)
  end
end
