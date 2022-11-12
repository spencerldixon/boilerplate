admin = FactoryBot.create(
  :user, :admin, :confirmed,
  email: "test@test.com",
  password: "test1234test",
  password_confirmation: "test1234test",
)

puts "Admin user created!"
puts "Username: #{admin.email}"
puts "Password: #{admin.password}"
