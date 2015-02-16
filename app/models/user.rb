class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :wikis

 after_create :set_default_value

 def basic_member?
   role == 'basic_member'
 end
 
 def premium_member?
   role == 'premium_member'
 end

 def administrator?
   role == 'administrator'
 end

 private

 def set_default_value
   self.update_attribute(:role, "basic_member")
 end

end
