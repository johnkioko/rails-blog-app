require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'index page' do
    before(:each) do
      @first_user = User.create(name: 'John',
                                photo: 'https://shorturl.at/gimsH', bio: 'Engineer from Canada.')
      @second_user = User.create(name: 'Jane',
                                 photo: 'https://shorturl.at/foAO2', bio: 'Doctor from Australia')

      @first_post = Post.create(author: @first_user, title: 'Introduction',
                                text: 'Lorem ipsum dolor sit amet. Consectetur adipiscing elit.')
      @second_post = Post.create(author: @second_user, title: 'First Impressions',
                                 text: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi John!')
      Comment.create(post: @second_post, author: @first_user, text: 'Hi Jane, Your post is insightful!')
      Comment.create(post: @first_post, author: @second_user, text: 'Thanks John!')
      Comment.create(post: @second_post, author: @first_user, text: "You're welcome, Jane. Keep up the good work!")

      Like.create(post: @first_post, author: @second_user)
      Like.create(post: @second_post, author: @first_user)

      @user = @first_user

      @user = @first_user

      visit all_post_path(@first_user.id)
    end
    scenario 'can see the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    scenario 'can see the user\'s username.' do
      expect(page).to have_content(@first_user.name)
    end

    scenario 'can see a post\'s title.' do
      expect(page).to have_content(@first_post.title)
    end

    scenario 'can see some of the post\'s body.' do
      expect(page).to have_content(@first_post.text[0..50])
    end

    scenario 'can see the first comments on a post.' do
      expect(page).to have_content(@first_post.comments.last.text)
    end

    scenario 'can see how many comments a post has.' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    scenario 'can see how many likes a post has.' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    scenario 'can see When I click on a post, it redirects me to that post\'s show page.' do
      first('.post-container > a').click
      expect("#{page.current_url}/#{@first_post.id}").to match post_id_path(@first_user, @first_post)
    end
  end
end
