Structure for seeds

15.times do |i|
  u = User.create(
   name: Faker::Pokemon.name,
   email: "user#{i}@example.com",
   password: 'password',
   password_confirmation: 'password'
  )
end

users = User.all

users.each do |user|
 15.times do
   p = user.posts.create(
   title: Faker::Lorem.sentence,
   body: Faker::Lorem.paragraph(2, true),
   image: "http://recantoadormecido.com.br/wp-content/plugins/doptg/uploads/thumbs/mXg5a7zNtz9A5GFCZcZc2RK4FdCOr7jQKQNK5q97qj8Cy5wDHN7DzhrW58XWMLhO4.jpg"
   )
 end
end

posts = Post.all
posts.each do |post|
 5.times do
   c = post.comments.create(
    body: Faker::Lorem.sentence,
    user: users.sample
   )
   puts c.errors.full_messages unless c.valid?
 end
end
