require 'rails_helper'
RSpec.describe 'Users', type: :feature do
  describe 'index page' do
    before(:each) do
      @first_user = User.create(name: 'Harry njuguna',
                                photo: 'https://wallpapers.com/images/featured/2zmiybnpu693b69o.jpg', bio: 'Teacher from USA.')
      @second_user = User.create(name: 'John K',
                                 photo: 'https://i.pinimg.com/736x/b1/1a/7e/b11a7e8ad1ef52c852b64d1c8ebf7f97.jpg', bio: 'Teacher from Poland')

      @first_post = Post.create(author: @first_user, title: 'A journey of a thousand miles ',
                                text: 'Welcome to team. We\'re heading to the moon')


      @users = User.all
    end
    scenario 'can see the username of all other users.' do
      visit start_path
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    scenario 'can see the image of all users' do
      visit start_path
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
  end
end
