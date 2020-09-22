# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /articles
  # GET /articles.json
  def index
    @users = User.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @user = User.find(params[:id])
    @post_question = Question.where(user_id: @user.id).count
    @answer_question = Answer.where(user_id: @user.id).count
    @post_comment = Comment.where(user_id: @user.id).count
    # @good = Cgood.where(comment_id: @user.).count
  end

  # GET /articles/new
  def new
    @user = User.new
  end

  # GET /articles/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # uemura add :created_at
  def user_params
    params.require(:user).permit(:name, :nickname, :hypaccount)
  end
end
