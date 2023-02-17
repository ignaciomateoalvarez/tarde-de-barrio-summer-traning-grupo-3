class StudentsController < ApplicationController
  def index
    @presenter = StudentsPresenter.new(params)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: 'Created student successfully'
    else
      redirect_to students_path, alert: 'Could not create student'
    end
  end

  def show
    @student = Student.find(params[:id]).decorate
  end

  private

  def student_params
    params.require(:student).permit(:name, :lastname, :birthday, :address, :school_grade, :currently_studying)
  end
end
