 require 'faker'


 # Create an admin user
 admin = User.new(
   email:    'admin1@example.com',
   password: 'helloworld',
   role:     'administrator'
 )

 admin.save!
 
 # Create a moderator
 moderator = User.new(
   email:    'moderator1@example.com',
   password: 'helloworld',
   role:     'moderator'
 )

 moderator.save!
 
 # Create a member
 member = User.new(
   email:    'member1@example.com',
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

 