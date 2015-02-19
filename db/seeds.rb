 require 'faker'


 # Create an admin user
 admin = User.new(
   email:    'admin14@example.com',
   password: 'helloworld',
 )

 admin.save!
 admin.update_attribute(:role, "administrator")
 # Create a moderator
 moderator = User.new(
   email:    'moderator14@example.com',
   password: 'helloworld',

 )

 moderator.save!
 moderator.update_attribute(:role, "moderator")
 # Create a member
 member = User.new(
   email:    'member14@example.com',
   password: 'helloworld'
 )

 member.save!

 users = User.all


 15.times do
   Wiki.create!(
     title: Faker::Lorem.sentence,
     body:  Faker::Lorem.paragraph,
     user:  users.sample
   )
 end
 wikis = Wiki.all
 puts "Seeds finished"

 