class LikesController < ApplicationController
  before_action :set_comment,:find_comment_like,:set_student, only: %i[toggle_comment_like]
  before_action :set_post,:find_post_like, only: %i[toggle_post_like]

  def toggle_comment_like
    if @like.exists?
      @comment.likes.find_by(user: current_user).destroy
    else
      @comment.likes.create(user: current_user)
    end
    redirect_to student_path(params[:student_id])
    # respond_to do |format|
    #   format.html { redirect_to student_path(params[:student_id])}
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace(
    #       @comment, 
    #       partial: 'comments/comment',
    #       locals: {comment: @comment.decorate, student: @student, featured: @comment.stand_out})
    #   end
    # end
  end

  def toggle_post_like
    if @like.exists?
      @post.likes.find_by(user: current_user).destroy
    else
      @post.likes.create(user: current_user)
    end
    redirect_to root_path
    # respond_to do |format|
    #   format.html { redirect_to root_path}
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace(
    #       @post, 
    #       partial: 'home/publication',
    #       locals: {publication: @post.decorate, featured: @post.stand_out})
    #   end
    # end
  end
  
  private

  def set_student
    @student = params[:student_id]
  end

  def find_comment_like
    @like = set_comment.likes.where(user: current_user)
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_post
    @post= Post.find(params[:post_id])
  end

  def find_post_like
    @like = set_post.likes.where(user: current_user)
  end

end
