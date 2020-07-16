class ScreamController < ApplicationController
  def index
    # (...データベースからのデータ取得処理...)
    # ダミーのデータを用意
    #array = [ 1, 2, 3, 4, 5, 6,7,8,9,10 ]
    @lesson=Lesson.find(params[:id])
    @course=Course.find(@lesson.course_id)
    array=Bar.where(lesson_id:params[:id])
    #array_scores = [ 1, 2, 3,4, 20, 10 ]
    @pages=array.pluck(:page)
    @scores=array.pluck(:score)
    product_B_sales = [   300_000,   500_000,   750_000,
      1_150_000, 1_350_000, 1_600_000 ]
    
    # グラフ（チャート）を作成 
    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: @course.course_name+' '+@lesson.title)
      # X軸の名称を設定 '月'
      c.xAxis(categories: @pages, title: {text: 'ページ数'})       # Y軸の名称を設定 '円'
      c.yAxis(title: {text: 'scream'})
      c.series(name: "A", data: @scores,color:'red')
      #c.series(name: "B", data: product_B_sales)
      # 判例を右側に配置
     c.legend(align: 'right', verticalAlign: 'top', 
       x: -100, y: 180, layout: 'vertical')
     # グラフの種類を「折れ線グラフ」から「棒グラフ」に変更
     c.chart(type: "column")
    end
  end
end
