require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'index page' do
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
      @user = @first_user

      visit post_id_path(@first_user.id, @first_post.id)
    end
    scenario 'can see the post\'s title' do
      expect(page).to have_content(@first_post.title)
    end

    scenario 'can see who wrote the post.' do
      expect(page).to have_content(@first_user.name)
    end

    scenario 'can see how many comments it has.' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    scenario 'can see how many likes it has.' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    scenario 'can see the post body.' do
      expect(page).to have_content(@first_post.text)
    end

    scenario 'can see the username of each commentor.' do
      @first_post.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    scenario 'can see the comment each commentor left.' do
      @first_post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end