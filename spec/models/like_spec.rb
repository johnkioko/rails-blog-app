require 'rails_helper'

RSpec.describe Like, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  before(:each) do
    @post = Post.create(AuthorId: subject.id, Title: 'check post',
                        Text: 'Unit test for the method of most_recent_posts')
    @comment = Comment.create(AuthorId: subject.id, PostId: @post.id,
                              Text: 'Unit test for the method of most_recent_comments')
  end

  it 'Correct AuthorId is present' do
    like = Like.new(AuthorId: subject.id, PostId: @post.id)

    id = like.AuthorId

    expect(id).to eq(subject.id)
  end
end
