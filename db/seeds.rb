# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all
Category.destroy_all
User.destroy_all
Comment.destroy_all

5.times do |category_index|
  category = Category.create!(
    title: "Category #{category_index + 1}",
    description: "Description for Category #{category_index + 1}",
    created_at: Time.now,
    updated_at: Time.now
  )
end

10.times do |user_index|
  user = User.create!(
    name: "User #{user_index + 1}",
    email: "user#{user_index + 1}@example.com",
    created_at: Time.now,
    updated_at: Time.now
  )

  5.times do |post_index|
    post = Post.create!(
      tittle: "Post #{post_index + 1} by User #{user_index + 1}",
      body: "Body for Post #{post_index + 1} by User #{user_index + 1}",
      created_at: Time.now,
      updated_at: Time.now,
      category_id: Category.all.sample.id,
      user_id: user.id
    )

    Comment.create!(
      commentable_type: 'Post',
      commentable_id: post.id,
      body: "Comment for Post #{post_index + 1} by User #{user_index + 1}",
      user_id: user.id,
      created_at: Time.now,
      updated_at: Time.now
    )
  end
end