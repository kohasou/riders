class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    #ユーザー一覧表示
    @users = User.all
  end

  def show
    #ユーザー個別表示
    @user = User.find(params[:id])
  end

  def edit
    #ユーザー情報編集
    @user = User.find(params[:id])
  end

  def profile
    #ユーザーのプロフィール表示
    @user = User.find(params[:id])
    #ユーザーの投稿一覧
    @posts = @user.posts
  end

  def update
    #ユーザーの情報編集
    @user = User.find(params[:id])
    #更新処理
    if @user.update(user_params)
      redirect_to admin_user_show_path(@user.id)
    else
    #更新失敗した場合
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :nickname, :introduction, :telephone_number, :id, :is_active)
  end
end
