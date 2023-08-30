class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:nices]

  def show
    #ユーザーのプロフィール
    @user = User.find(params[:id])
    #ユーザーの投稿一覧
    @posts = @user.posts
  end

  def edit
    #プロフィール編集
      #ログインしているユーザー
    @user = current_user
  end

  def withdrawal
  end

  def nices
    #ユーザーのいいね一覧
    @user = User.find(params[:id])
    nices = Nice.where(user_id: @user.id).pluck(:post_id)
    @nice_posts = Post.find(nices)
  end

  def deleteprocess
    #退会処理
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
    #更新
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :image, :introduction, :telephone_number, :email,)
  end

end
