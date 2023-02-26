class StudentsController < ApplicationController
  before_action :set_student, only: %i[edit update destroy]

  def index
    @presenter = StudentsPresenter.new(params)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user
    if @student.save
      redirect_to students_path, notice: 'Created student successfully'
    else
      redirect_to students_path, alert: 'Could not create student'
    end
  end

  def show
    @student = Student.find(params[:id]).decorate
  end

  def edit
    authorize @student
  end

  def update
    authorize @student
    if @student.update(student_params)
      flash[:notice] = 'Edit Student'
    else
      flash[:alert] = 'Could not edit student'
    end
    redirect_to students_path
  end

  def destroy
    authorize @student
    if @student.destroy
      flash[:notice] = 'Deleted Student'
    else
      flash[:alert] = 'Could not delete student'
    end
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :lastname, :birthday, :address, :school_grade, :currently_studying)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
