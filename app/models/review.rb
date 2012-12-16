class Review < ActiveRecord::Base
  attr_accessible :content
  
  validates :content, :presence => true

  belongs_to :product
  belongs_to :user
  
  default_scope order("created_at DESC")
end
