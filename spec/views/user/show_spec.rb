require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'show page' do
    before(:each) do
      @first_user = User.create(name: 'Monkey D Luffy', photo: 'https://wallpapers.com/images/featured/2zmiybnpu693b69o.jpg', bio: 'The guy who is gonna become the next pirate king.')
      @second_user = User.create(name: 'Roronoa Zoro', photo: 'https://i.pinimg.com/736x/b1/1a/7e/b11a7e8ad1ef52c852b64d1c8ebf7f97.jpg', bio: 'The guy who is gonna become the worlds greatest Swordsmen')

      @first_post = Post.create(author: @first_user, title: 'Journey to the Grand Line', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed congue tortor vel varius.')
      @second_post = Post.create(author: @second_user, title: 'Training with Mihawk', text: 'Donec eget mauris consectetur, laoreet libero ac, porttitor lacus.')

      Comment.create(post: @first_post, author: @second_user, text: 'Nice post Luffy!')
      Comment.create(post: @second_post, author: @first_user, text: 'Awesome, Zoro is training hard!')
      Comment.create(post: @second_post, author: @second_user, text: 'Thanks Luffy, I need to become stronger!')
      Comment.create(post: @first_post, author: @first_user, text: 'I am gonna be the king of the pirates!')

      Like.create(post: @first_post, author: @second_user)
      Like.create(post: @second_post, author: @first_user)
      @users = User.all

      visit user_id_path(@first_user.id)
    end

    scenario 'can see the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    scenario 'can see the user\'s username.' do
      expect(page).to have_content(@first_user.name)
    end

    scenario 'can see the user\'s bio.' do
      expect(page).to have_content(@first_user.bio)
    end

    scenario 'can see the user\'s first 3 posts.' do
      @posts = @first_user.posts
      @posts.each do |post|
        expect(page).to have_content(post.text[0..120])
      end
    end

    scenario 'can see a button that lets me view all of a user\'s posts' do
      expect(page).to have_content('See All Post')
    end

    scenario 'can see when click see all posts, it redirects me to that user\'s post\'s index page' do
      click_link 'See All Post'
      expect("#{page.current_url}/posts").to match all_post_path(@first_user.id)
    end
  end
end