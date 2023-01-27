class Post < ApplicationRecord
  after_create :update_posts_counter
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def update_posts_counter
    User.find_by(name: author.name).increment!(:posts_counter)
  end
end
