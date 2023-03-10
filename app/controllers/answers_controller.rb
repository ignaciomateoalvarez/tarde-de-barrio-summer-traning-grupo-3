class AnswersController < ApplicationController
  before_action :set_student, only: %i[create]

  def create
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.create(publication_params)
    @answer.user = current_user
    if @answer.save
      redirect_to student_path(@student), notice: 'Answer was created.'
    else
      redirect_to student_path(@student), notice: 'Answer was not created.'
    end
  end

  def create_post
    @post = Post.find(params[:post_id])
    @answer = @post.answers.create(publication_params)
    @answer.user = current_user
    if @answer.save
      redirect_to root_path, notice: 'Answer was created.'
    else
      redirect_to root_path, notice: 'Answer was not created.'
    end
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def publication_params
    params.require(:answer).permit(:body)
  end
end
