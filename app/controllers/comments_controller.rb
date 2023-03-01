class CommentsController < ApplicationController
  before_action :set_student, only: %i[create]

  def create
    @comment = @student.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to student_path(@student), notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
