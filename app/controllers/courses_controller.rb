class CoursesController < ApplicationController

  before_action :load_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.order(:name)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save
    respond_with @course, location: courses_path
  end

  def show
    respond_with @course, location: courses_path
  end

  def edit

  end

  def update
    @course.update_attributes(course_params) if params[:course]
    respond_with @course, location: courses_path
  end

  def destroy
    @course.destroy
    respond_with @course, location: courses_path
  end

  private

  def course_params
    params.require(:course).permit! if params[:course]
  end

  def load_course
    @course = Course.find(params[:id])
  end
end
