class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    #検索
    @range = params[:range]

    if @range == "User"
      #ユーザー検索
      @users = User.looks(params[:search], params[:word])
    else
      #投稿検索
      @posts = Post.looks(params[:search], params[:word])
    end
  end
end
