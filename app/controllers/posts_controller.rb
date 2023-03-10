class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path, notice: t('.notice')
    else
      redirect_to root_path, warning: t('.warning')
    end
  end

  private

  def post_params
    params.require(:publication).permit(:body, :stand_out, files: [])
  end
end
