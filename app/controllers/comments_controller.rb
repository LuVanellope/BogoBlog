class CommentsController < ApplicationController

  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit[:comment])
    redirect_to post_path(@post)
  end
end
