 # Create an admin user
 admin = User.new(
   email:    'admin2@example.com',
   password: 'helloworld',
   role:     'administrator'
 )

 admin.save!
 
 # Create a moderator
 moderator = User.new(
   email:    'moderator2@example.com',
   password: 'helloworld',
   role:     'moderator'
 )

 moderator.save!
 
 # Create a member
 member = User.new(
   email:    'member2@example.com',
   password: 'helloworld'
 )

 member.save!