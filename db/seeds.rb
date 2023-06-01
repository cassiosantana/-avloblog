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

post_name_counter = 1

5.times do |category_index|
  category = Category.create!(
    title: "Category #{category_index + 1}",
    description: "Description for Category #{category_index + 1}",
    created_at: Time.now,
    updated_at: Time.now
  )

  5.times do
    Post.create!(
      tittle: "Post #{post_name_counter}",
      body: "Body for Post #{post_name_counter} in Category #{category_index + 1}",
      created_at: Time.now,
      updated_at: Time.now,
      category_id: category.id
    )
    post_name_counter += 1
  end
end

5.times do |user_index|
  User.create!(
    name: "User #{user_index + 1}",
    email: "user#{user_index + 1}@example.com",
    created_at: Time.now,
    updated_at: Time.now
  )
end