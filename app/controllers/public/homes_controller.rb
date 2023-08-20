class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:image, :body)
  end
end
