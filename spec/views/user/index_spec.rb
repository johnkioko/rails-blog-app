require 'rails_helper'
RSpec.describe 'Users', type: :feature do
  describe 'index page' do
    before(:each) do
      @first_user = User.create(name: 'Monkey D Luffy', photo: 'https://wallpapers.com/images/featured/2zmiybnpu693b69o.jpg', bio: 'The guy who is gonna become the next pirate king.')
      @second_user = User.create(name: 'Roronoa Zoro', photo: 'https://i.pinimg.com/736x/b1/1a/7e/b11a7e8ad1ef52c852b64d1c8ebf7f97.jpg',
                                 bio: 'The guy who is gonna become the worlds greatest Swordsmen')

      @first_post = Post.create(author: @first_user, title: 'Journey to the Grand Line', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed congue tortor vel varius.')
      @second_post = Post.create(author: @second_user, title: 'Training with Mihawk', text: 'Donec eget mauris consectetur, laoreet libero ac, porttitor lacus.')

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
