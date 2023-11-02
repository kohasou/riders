class Public::NicesController < ApplicationController
  def create
    #いいね作成
    post = Post.find(params[:post_id])
    nice=current_user.active_like.new(post_id:params[:post_id])
    #いいねを保存
    nice.save
    #通知送信
    @post.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
    redirect_to posts_path(post)
  end

  def destroy
    #いいねを削除
    post = Post.find(params[:post_id])
    nice = current_user.nices.find_by(post_id: post.id)
    #いいねの削除
    nice.destroy
    redirect_to posts_path(post)
  end
end

