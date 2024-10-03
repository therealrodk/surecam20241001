# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
User.create!(email: "bob@test.com", password: "password", password_confirmation: "password") unless User.find_by(email: "bob@test.com")
User.create!(email: "fred@test.com", password: "password", password_confirmation: "password") unless User.find_by(email: "fred@test.com")

# Blog Posts
Post.create!(user_id: User.first.id, title: "Public post by #{User.first.email}", body: "<p>Stuff goes here</p>")
Post.create!(user_id: User.last.id, title: "Public post by #{User.last.email}", body: "<p>Stuff goes here</p>")
Post.create!(user_id: User.first.id, title: "Private post by #{User.first.email}", body: "<p>Stuff goes here</p>", active: false)
Post.create!(user_id: User.last.id, title: "Private post by #{User.last.email}", body: "<p>Stuff goes here</p>", active: false)
