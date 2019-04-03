puts "Create Guide User"
user = User.create!(email: 'guide@guruwalk.com', password: 'password', password_confirmation: 'password', name: 'Guru Guide')
user.add_role :guide

puts "Create User"
User.create!(email: 'anshul@guruwalk.com', password: 'password', password_confirmation: 'password', name: 'Anshul Kumar')
