class TopController < ApplicationController
  def index
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
