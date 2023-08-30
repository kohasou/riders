class Public::HomesController < ApplicationController

  def top
    #全ての会員の投稿一覧
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:image, :body)
  end
end
