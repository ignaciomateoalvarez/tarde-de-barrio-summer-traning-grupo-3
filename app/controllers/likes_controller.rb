class LikesController < ApplicationController
  before_action :set_comment,:find_like,:set_student, only: %i[toggle_comment_like]

  def toggle_comment_like

    if @like.exists?
      @like.destroy
    else
      @comment.likes.create(user: current_user)
    end
    respond_to do |format|
      format.html { redirect_to student_path(params[:student_id])}
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          @comment, 
          partial: 'comments/comment',
          locals: {comment: @comment.decorate, student: @student, featured: @comment.stand_out})
      end
    end
  end

  private

  def set_student
    @student = params[:student_id]
  end

  def find_like
    @like = Like.find_by(user: current_user, comment_id: params[:comment_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
