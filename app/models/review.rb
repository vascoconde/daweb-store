class Review < ActiveRecord::Base
  attr_accessible :content

  belongs_to :product
  belongs_to :user
end
