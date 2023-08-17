class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :nices, dependent: :destroy
    has_many :comments, dependent: :destroy

  def niced_by?(user)
    nices.exists?(user_id: user.id)
  end

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("body LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("body LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
