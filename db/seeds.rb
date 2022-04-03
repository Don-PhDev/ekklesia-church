def data_deleter
  Post.delete_all
  User.delete_all
end

def data_creator
  User.create(
    email: "don@gmail.com",
    password: "password",
    password_confirmation: "password",
    admin: true
  )

  3.times do
    User.create!(
      email: [
        Faker::Internet.unique.user_name,
        Faker::Internet.email.split("@").last
      ].join("@"),
      password: "password",
      password_confirmation: "password"
    )
  end

  30.times do
    Post.create!(
      user: User.all.to_a.sample,
      title: Faker::Book.title,
      body: Faker::Lorem.paragraphs.join(" ")
    )
  end
end

def data_count_message
  puts "Users: #{User.count}"
  puts "Posts: #{Post.count}"
end

data_deleter
data_creator
data_count_message
