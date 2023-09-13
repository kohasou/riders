class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :index ]

  def new
    #投稿作成
    @post = Post.new
  end

  def create
    #投稿作成
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #投稿を保存
    if @post.save
      redirect_to post_path(@post.id)
    else
    #処理失敗した場合
      render :new
    end
  end

  def index
    #ユーザーすべての投稿一覧
    @posts = Post.all
  end

  def show
    #ユーザーの投稿詳細
    @post = Post.find(params[:id])
    #コメントの作成
    @comment = Comment.new
  end

  def edit
    #投稿の編集
    #ログインしているユーザー
    @post = Post.find(params[:id])
  end

  def update
    #投稿の更新
    @post = Post.find(params[:id])
    #更新処理
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
    #処理失敗した場合
      render :edit
    end
  end

  def destroy
    #投稿の削除
    post = Post.find(params[:id])
    #削除処理
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :body)
  end
end
