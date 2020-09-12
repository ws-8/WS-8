# frozen_string_literal: true

require 'Kconv'

class CourseFilesController < ApplicationController
  before_action :set_course_file, only: %i[show edit update destroy]

  # GET /course_files
  # GET /course_files.json
  def index
    @course_files = CourseFile.all
  end

  # GET /course_files/1
  # GET /course_files/1.json
  def show; end

  # GET /course_files/new
  def new
    @course_file = CourseFile.new
  end

  # GET /course_files/1/edit
  def edit; end

  # POST /course_files
  # POST /course_files.json
  def create
    @course_file = CourseFile.new(course_file_params)

    file = course_file_params[:file]
    file_name = file.original_filename
    @course_file.filename = file.original_filename
    result = uploadpdf(file, file_name)

    respond_to do |format|
      if result == 'success' && @course_file.save
        format.html { redirect_to @course_file, notice: 'Myfile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_file }
      else
        deletepdf(file_name)
        format.html { render action: 'new' }
        format.json { render json: @course_file.errors, status: :unprocessable_entity }
      end
    end
 end

  # PATCH/PUT /course_files/1
  # PATCH/PUT /course_files/1.json
  def update
    respond_to do |format|
      if @course_file.update(course_file_params)
        format.html { redirect_to @course_file, notice: 'Course file was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_file }
      else
        format.html { render :edit }
        format.json { render json: @course_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_files/1
  # DELETE /course_files/1.json
  def destroy
    @course_file.destroy
    respond_to do |format|
      format.html { redirect_to course_files_url, notice: 'Course file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_file
    @course_file = CourseFile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_file_params
    params.require(:course_file).permit(:title, :file, :comment)
  end

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

  def deleteipdf(file_name)
    File.unlink 'public/' + file_name.toutf8
  end
end
