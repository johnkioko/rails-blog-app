class User < ApplicationRecord
  has_many :posts, foreign_key: 'AuthorId'
  has_many :comments, foreign_key: 'AuthorId'
  has_many :likes, foreign_key: 'AuthorId'

  def latest_posts
    Post.where(author: self).limit(3)
  end

  validates :Name, presence: true
  validates :PostCounter, numericality: { greater_than_or_equal_to: 0 }
end
