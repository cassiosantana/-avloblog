# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'ffaker'

Post.destroy_all
Category.destroy_all
Comment.destroy_all
User.destroy_all

5.times do
  category = Category.create!(
    title: FFaker::Book.genre,
    description: FFaker::Lorem.paragraph,
    created_at: Time.now,
    updated_at: Time.now
  )
end

10.times do
  user = User.create!(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    created_at: Time.now,
    updated_at: Time.now
  )

  5.times do |post_index|
    post = Post.create!(
      tittle: FFaker::Book.title,
      body: Array.new(3) { FFaker::Lorem.paragraph }.join("\n\n"),
      created_at: Time.now,
      updated_at: Time.now,
      category_id: Category.all.sample.id,
      user_id: user.id
    )

    Comment.create!(
      commentable_type: 'Post',
      commentable_id: post.id,
      body: FFaker::Lorem.sentence,
      user_id: user.id,
      created_at: Time.now,
      updated_at: Time.now
    )
  end
end