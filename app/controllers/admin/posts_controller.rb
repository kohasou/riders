class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    #全てのユーザーの投稿表示
    @posts = Post.all
  end

  def show
    #投稿の詳細を表示
    @post = Post.find(params[:id])
  end

  def edit
    #投稿の編集
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    #投稿の更新処理
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
    #更新失敗の場合
      render :edit
    end
  end

  def destroy
    #投稿の削除
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :body)
  end
end
