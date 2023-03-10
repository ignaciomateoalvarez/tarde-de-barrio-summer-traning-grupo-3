class StudentsController < ApplicationController
  before_action :set_student, only: %i[edit update destroy show]

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
      redirect_to students_path, notice: t('.notice')
    else
      redirect_to students_path, alert: t('.alert')
    end
  end

  def show
    @presenter ||= StudentsPresenter.new(params, @student)
  end

  def edit
    authorize @student
  end

  def update
    if @student.update(student_params)
      flash[:notice] = t('.notice')
    else
      flash[:alert] = t('.alert')
    end
    redirect_to students_path
  end

  def destroy
    authorize @student
    if @student.destroy
      flash[:notice] = t('.notice')
    else
      flash[:alert] = t('.alert')
    end
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :lastname, :birthday, :address, :school_grade, :currently_studying)
  end

  def set_student
    @student = Student.find(params[:id]).decorate
  end
end
