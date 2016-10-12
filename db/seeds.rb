User.create(name:  "Dinh Duc",
  email: "dinhduc0605@gmail.com",
  password: "dinhduc",
  password_confirmation: "dinhduc",
  admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create(name:  name,
  email: email,
  password: password,
  password_confirmation: password)
end
