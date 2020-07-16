class ScreamController < ApplicationController
  def index
    # (...データベースからのデータ取得処理...)
    # ダミーのデータを用意
    array = [ 1, 2, 3, 4, 5, 6,7,8,9,10 ]
    array_scores = [ 1, 2, 3,
      4, 20, 10 ]
    product_B_sales = [   300_000,   500_000,   750_000,
      1_150_000, 1_350_000, 1_600_000 ]
    
    # グラフ（チャート）を作成 
    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "情報学展望1 資料1")
      # X軸の名称を設定 '月'
      c.xAxis(categories: array, title: {text: 'ページ数'})       # Y軸の名称を設定 '円'
      c.yAxis(title: {text: 'scream'})
      c.series(name: "A", data: array_scores)
      #c.series(name: "B", data: product_B_sales)
      # 判例を右側に配置
     c.legend(align: 'right', verticalAlign: 'top', 
       x: -100, y: 180, layout: 'vertical')
     # グラフの種類を「折れ線グラフ」から「棒グラフ」に変更
     c.chart(type: "column")
    end
  end
end
