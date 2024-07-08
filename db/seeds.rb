# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

Post.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('posts')

users = [
  {first_name: "Ram", last_name: "Kumar"},
  {first_name: "Sunil", last_name: "Raj"},
  {first_name: "Dinesh", last_name: "Gupta"}
]
users.each do |user_params|
  User.create!(first_name: user_params[:first_name], last_name: user_params[:last_name])
end
# users_with_posts = User.joins(:posts).select('users.*, posts.title AS post_title')
# users_with_posts = User.joins(:posts).select('users.first_name, posts.title AS post_title')

posts = [
  { title: 'Post 1', user_id:1 },
  { title: 'Post 2', user_id:1 },
  { title: 'Post 3', user_id:2 },
  { title: 'Post 4', user_id:3 },
  { title: 'Post 5', user_id:1 }
]

posts.each do |post_params|
  Post.create!(title: post_params[:title], user_id: post_params[:user_id])
end
