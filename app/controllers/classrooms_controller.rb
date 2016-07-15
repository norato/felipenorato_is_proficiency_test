class ClassroomsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @classroom  = Classroom.findclass(params[:course_id])
  end
  def show
  end
  def new
  end
  def create
  end
  def edit
  end
  def update
  end
  def delete
  end
end
