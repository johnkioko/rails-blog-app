require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Monkey D Luffy', photo: 'https://i.pinimg.com/736x/50/08/ef/5008efb9df96969624d2674645027a3a.jpg', bio: 'Future King of the Pirates.') }

  before { subject.save }

  it 'User should be not be Valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'User should have a name' do
    expect(subject.name).to be_present
  end
  it 'User should have a photo' do
    expect(subject.photo).to be_present
  end
  it 'User should have a bio' do
    expect(subject.bio).to be_present
  end
  it 'Likes Counter attribute should be greater or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'user name should not be more than 250' do
    subject.name = Faker::Lorem.characters(number: 251)
    expect(subject).to_not be_valid
  end
  it 'last_three_posts method should return the last three posts' do
    post1 = Post.create(title: 'Post 1', text: 'This is the first post')
    post2 = Post.create(title: 'Post 2', text: 'This is the second post')
    post3 = Post.create(title: 'Post 3', text: 'This is the third post')
    post4 = Post.create(title: 'Post 4', text: 'This is the fourth post')
    subject.posts << post1 << post2 << post3 << post4
    expect(subject.last_three_posts.size).to be(3)
    expect(subject.last_three_posts.pluck(:id)).to match_array([post2.id, post3.id, post4.id])
  end
end
