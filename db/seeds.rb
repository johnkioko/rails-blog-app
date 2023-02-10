# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Harry njuguna', photo: 'https://wallpapers.com/images/featured/2zmiybnpu693b69o.jpg', bio: 'Teacher from USA.')
second_user = User.create(name: 'John K', photo: 'https://i.pinimg.com/736x/b1/1a/7e/b11a7e8ad1ef52c852b64d1c8ebf7f97.jpg', bio: 'Teacher from Poland')

first_post = Post.create(author: first_user, title: 'Greetings', text: 'Hello there')

Comment.create(post: first_post, author: second_user, text: "Hi Mutisya")
Comment.create(post: first_post, author: first_user, text: "Kudos")

Like.create(post: first_post, author: second_user)
Like.create(post: first_post, author: first_user)
Like.create(post: first_post, author: first_user)
