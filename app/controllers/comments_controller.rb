class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save


    redirect_to post_path(@post)
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully updated.' }

      else
        format.html { redirect_to post_path(@post), notice: 'Oh oh this comment wasn\'t updated' }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
