class TopController < ApplicationController
  def index
    @courses = Course.select("course_name")
    query = 'SELECT course_name, title FROM lessons, courses WHERE courses.id == lessons.classid'
    @lessons = Course.find_by_sql(query)
  end

  def create
    user = User.find_by(email: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      render top_page_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'index'
    end
  end
end
