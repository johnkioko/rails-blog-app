class Post < ApplicationRecord
  after_create :update_posts_counter
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  private

 def update_post_counter
   author.increment!(:posts_counter)
 end
end
