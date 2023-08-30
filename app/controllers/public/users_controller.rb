class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:nices]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def withdrawal
  end

  def nices
    @user = User.find(params[:id])
    nices = Nice.where(user_id: @user.id).pluck(:post_id)
    @nice_posts = Post.find(nices)
  end

  def deleteprocess
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
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
