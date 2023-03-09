class SubcommentsController < ApplicationController
  before_action :set_student, only: %i[create]

  def create
    @subcomment = Subcomment.new(comment_params)
    @subcomment.user = current_user
    if @subcomment.save
      redirect_to student_path(@student), notice: t('.notice')
    else
      redirect_to student_path(@student), warning: t('.warning')
    end
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def comment_params
    params.require(:subcomment).permit(:body).merge(comment_id: params[:comment_id])
  end
end
