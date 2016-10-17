User.create(name:  "Dinh Duc",
  email: "dinhduc0605@gmail.com",
  password: "dinhduc",
  password_confirmation: "dinhduc",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create(name:  name,
  email: email,
  password: password,
  password_confirmation: password,
  activated: true,
  activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
