class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    #投稿全て表示
    @posts = Post.all
  end
end
