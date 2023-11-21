class Public::CommentsController < ApplicationController
  def create
    #コメントの作成
    post = Post.find(params[:post_id])
    reply = current_user.comments.new(comment_params)
    reply.post_id = post.id
    #コメントの保存
    reply.save
    #送信後の遷移先
    #通知送信
    post.create_notification_comment(current_user, reply.id)
    redirect_to post_path(post)
  end

  def destroy
    #コメントの削除
    Comment.find(params[:id]).destroy
    #削除後の遷移先
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
