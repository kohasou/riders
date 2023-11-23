class Public::NicesController < ApplicationController
  def create
    #いいね作成
    post = Post.find(params[:post_id])
    #いいねを保存
    nice = Nice.new(post_id: post.id, user_id: current_user.id)
    nice.save
    #通知送信
    post.create_notification_nice(current_user)
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

