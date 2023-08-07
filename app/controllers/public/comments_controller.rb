class Public::CommentsController < ApplicationController
    def create
    post = Post.find(params[:post_id])
    reply = current_user.comments.new(comment_params)
    reply.post_id = post.id
    reply.save
    redirect_to post_path(post)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
