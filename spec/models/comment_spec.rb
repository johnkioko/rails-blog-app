require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { User.new(Name: 'Tom', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }

  before { subject.save }

  before(:each) do
    @post = Post.create(AuthorId: subject.id, Title: 'check post',
                        Text: 'Unit test for the method of most_recent_posts')
    @comment = Comment.create(AuthorId: subject.id, PostId: @post.id,
                              Text: 'Unit test for the method of most_recent_comments')
  end

  it 'Text should match with the input text' do
    text = @comment.Text

    expect(text).to eq('Unit test for the method of most_recent_comments')
  end
end
