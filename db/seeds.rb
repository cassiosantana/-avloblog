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
  category_created_at = FFaker::Time.between(1.year.ago, 6.months.ago)
  Category.create!(
    title: FFaker::Book.genre,
    description: FFaker::Lorem.paragraph,
    created_at: category_created_at,
    updated_at: category_created_at
  )
end

10.times do
  user_created_at = FFaker::Time.between(6.months.ago, 1.month.ago)
  user = User.create!(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    created_at: user_created_at,
    updated_at: user_created_at
  )

  5.times do |post_index|
    post_created_at = FFaker::Time.between(user_created_at, Time.now)
    post = Post.create!(
      tittle: FFaker::Book.title,
      body: Array.new(3) { FFaker::Lorem.paragraph }.join("\n\n"),
      created_at: post_created_at,
      updated_at: post_created_at,
      category_id: Category.all.sample.id,
      user_id: user.id
    )

    comment_created_at = FFaker::Time.between(post_created_at, Time.now)
    Comment.create!(
      commentable_type: 'Post',
      commentable_id: post.id,
      body: FFaker::Lorem.sentence,
      user_id: user.id,
      created_at: comment_created_at,
      updated_at: comment_created_at
    )
  end
end