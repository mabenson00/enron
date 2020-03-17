# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([{ email: 'sender@test.com' }, { email: 'recipient@test.com' }])
email = Email.create(subject: "this is a subject", body: "this is a body")
SenderUserEmail.create(user: users[0], email: email)
RecipientUserEmail.create(user: users[1], email: email)