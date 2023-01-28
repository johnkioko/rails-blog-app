class Comment < ApplicationRecord
  after_create :update_comments_counter
  belongs_to :post
  belongs_to :author, class_name: 'User'

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
