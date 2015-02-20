class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations
  
  validates :title, length: {minimum: 5}, presence: true
end

