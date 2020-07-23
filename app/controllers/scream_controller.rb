# frozen_string_literal: true

class ScreamController < ApplicationController
  def index
    # (...データベースからのデータ取得処理...)
    # ダミーのデータを用意
    # array = [ 1, 2, 3, 4, 5, 6,7,8,9,10 ]
    @lesson = Lesson.find(params[:id])
    @course = Course.find(@lesson.course_id)
    @array = Bar.where(lesson_id: params[:id])
    # array_scores = [ 1, 2, 3,4, 20, 10 ]
    @pages = @array.pluck(:page)
    @max = @pages.max
    @scores = @array.pluck(:score)
    product_B_sales = [300_000, 500_000, 750_000,
                       1_150_000, 1_350_000, 1_600_000]


    # グラフ（チャート）を作成
    @chart = LazyHighCharts::HighChart.new('graph') do |c|
      c.title(text: @course.course_name + ' ' + @lesson.title)
      # X軸の名称を設定 '月'
      c.xAxis(categories: @pages, title: { text: 'ページ数' }) # Y軸の名称を設定 '円'
      c.yAxis(title: { text: 'scream' })
      c.series(name: 'A', data: @scores, color: 'red')
      # c.series(name: "B", data: product_B_sales)
      # 判例を右側に配置
      c.legend(align: 'bottom', verticalAlign: 'top',
               x: -100, y: 180, layout: 'vertical')
      # グラフの種類を「折れ線グラフ」から「棒グラフ」に変更
      c.chart(type: 'column')
    end
    
  end

  def button
    bar_array = Bar.where(lesson_id: params[:id]).where(page: params[:number])
    @bar = bar_array[0]
    @bar.score += 1
    @bar.save
    if Scream.where(bar_id: @bar.id).where(user_id: current_user.id).exists?
      scream_array = Scream.where(bar_id: @bar.id).where(user_id: current_user.id)
      @scream = scream_array[0]
      @scream.score += 1
      @scream.save
    else
      @scream = Scream.new(score: 1, bar_id: @bar.id, user_id: current_user.id)
      @scream.save
    end
    flash[:notice] = 'Posted Successfully!'
    redirect_back(fallback_location: root_path)
  end

  def question
    @lesson = Lesson.find(params[:id])
    @course = Course.find(@lesson.course_id)
    @array = Bar.where(lesson_id: params[:id])
    # array_scores = [ 1, 2, 3,4, 20, 10 ]
    @pages = @array.pluck(:page)
    @max = @pages.max
    @scores = @array.pluck(:score)
    product_B_sales = [300_000, 500_000, 750_000,
                       1_150_000, 1_350_000, 1_600_000]
    @questions = Question.where(lesson_id: @lesson.id).where(page: params[:p]) if params[:p].present?

    @chart = LazyHighCharts::HighChart.new('graph') do |c|
      c.title(text: @course.course_name + ' ' + @lesson.title)
      # X軸の名称を設定 '月'
      c.xAxis(categories: @pages, title: { text: 'ページ数' }) # Y軸の名称を設定 '円'
      c.yAxis(title: { text: 'scream' })
      c.series(name: 'A', data: @scores, color: 'red')
      # c.series(name: "B", data: product_B_sales)
      # 判例を右側に配置
      c.legend(align: 'bottom', verticalAlign: 'top',
               x: -100, y: 180, layout: 'vertical')
      # グラフの種類を「折れ線グラフ」から「棒グラフ」に変更
      c.chart(type: 'column')
    end
    
   
  end
end
