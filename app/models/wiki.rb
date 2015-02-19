class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :wiki_collaborations, through: :collaborations
  
  validates :title, length: {minimum: 5}, presence: true
end

