class StudentsController < ApplicationController
  before_action :load_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.order(:name)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with @student, location: students_path
  end

  def show
    respond_with @student, location: students_path
  end

  def edit

  end

  def update
    @student.update_attributes(student_params) if params[:student]
    respond_with @student, location: students_path
  end

  def destroy
    @student.destroy
    respond_with @student, location: students_path
  end

  private

  def student_params
    params.require(:student).permit! if params[:student]
  end

  def load_student
    @student = Student.find(params[:id])
  end
end
