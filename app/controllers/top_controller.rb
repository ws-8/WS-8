class TopController < ApplicationController
  def index
    if logged_in? then
      redirect_to '/top_page'
    end
  end
end
