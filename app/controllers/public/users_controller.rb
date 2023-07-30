class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def withdrawal
  end

  def deleteprocess
    
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
    if current_user.update(user_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :profile_image, :introduction, :telephone_number, :email,)
  end

end
