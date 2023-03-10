class AttendancesController < ApplicationController
  before_action :find_attendance, :set_student, only: %i[create]
  def create
    if @attendance.exists?
      @attendance.update(attendance_params)
    else
      @student_attendance = Attendance.new(attendance_params)
      @student_attendance.save
    end
    
  end
  
  private

  def set_student
    @student = params[:student_id]
  end

  def find_attendance
    @attendance = Attendance.where(student: set_student)
  end

  def attendance_params
    params.require(:attendance).permit(:assistant).merge(student_id: params[:student_id])
  end
end
