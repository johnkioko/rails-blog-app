require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Testing for no Title' do
    post = Post.create
    expect(post).to_not be_valid
  end

  it 'Testing post CommentCounter number negative' do
    post = Post.create(AuthorId: 1, Title: 'John', Text: 'anything')
    post.CommentCounter = -10
    expect(post).to_not be_valid
  end

  it 'Testing post LikeCounter number negative' do
    post = Post.create(AuthorId: 1, Title: 'John', Text: 'anything')
    post.LikeCounter = -10
    expect(post).to_not be_valid
  end

  it 'Title should be present' do
    post = Post.create(AuthorId: 1, Title: 'John', Text: 'anything')
    post.Title = nil
    expect(post).to_not be_valid
  end

  it 'Title should not exceed 250 characters' do
    subject.Title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'Has a latest_comments method' do
    post = Post.new(Title: 'this is a post', CommentCounter: 5, LikeCounter: 10)
    expect(post).to respond_to(:latest_comments)
  end
end
