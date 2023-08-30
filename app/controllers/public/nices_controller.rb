class Public::NicesController < ApplicationController
  def create
    #いいね作成
    post = Post.find(params[:post_id])
    nice = current_user.nices.new(post_id: post.id)
    #いいねを保存
    nice.save
    redirect_to posts_path(post)
  end

  def destroy
    #いいねを削除
    post = Post.find(params[:post_id])
    nice = current_user.nices.find_by(post_id: post.id)
    #いいねの削除処理
    nice.destroy
    redirect_to posts_path(post)
  end
end

