# frozen_string_literal: true

require 'kconv'

class LessonFilesController < ApplicationController
  before_action :set_lesson_file, only: %i[edit update destroy]

  # GET /lesson_files
  # GET /lesson_files.json
  def index
    @lesson_files = LessonFile.all
  end

  # GET /lesson_files/1
  # GET /lesson_files/1.json
  def show
    @lesson_files = LessonFile.where(lesson_id: params[:id])
    @lesson = Lesson.find(params[:id])
    @course = Course.find(@lesson.course_id)
    # binding.pry
  end

  # GET /lesson_files/new
  def new
    @lesson = Lesson.find(params[:id])
    @lesson_file = @lesson.lesson_files.build
  end

  # GET /lesson_files/1/edit
  def edit; end

  # POST /lesson_files
  # POST /lesson_files.json
  def create
    @lesson_file = LessonFile.new(lesson_file_params)
    file = lesson_file_params[:file]
    file_name = file.original_filename
    @lesson_file.filename = file.original_filename
    result = uploadpdf(file, file_name)
    # binding.pry

    respond_to do |format|
      if result == 'success' && @lesson_file.save
        format.html { redirect_to lesson_file_path(id: @lesson_file.lesson_id), notice: 'Myfile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lesson_file }
      else
        deletepdf(file_name)
        format.html { render action: 'new' }
        format.json { render json: @lesson_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_files/1
  # PATCH/PUT /lesson_files/1.json
  def update
    respond_to do |format|
      if @lesson_file.update(lesson_file_params)
        format.html { redirect_to @lesson_file, notice: 'Lesson file was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_file }
      else
        format.html { render :edit }
        format.json { render json: @lesson_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_files/1
  # DELETE /lesson_files/1.json
  def destroy
    @lesson_file.destroy
    respond_to do |format|
      format.html { redirect_to lesson_files_url, notice: 'Lesson file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def uploadpdf(file_object, file_name)
    ext = file_name[file_name.rindex('.') + 1, 4].downcase
    perms = ['.pdf']
    if !perms.include?(File.extname(file_name).downcase)
      result = 'アップロードできるのはpdfファイルのみです。'
    elsif file_object.size > 10.megabyte
      result = 'ファイルサイズは10MBまでです。'
    else
      File.open("public/#{file_name.toutf8}", 'wb') { |f| f.write(file_object.read) }
      result = 'success'
    end
    result
  end

  def deletepdf(file_name)
    File.unlink 'public/' + file_name.toutf8
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_file
    @lesson_file = LessonFile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_file_params
    params.require(:lesson_file).permit(:title, :file, :comment, :lesson_id)
  end
end
