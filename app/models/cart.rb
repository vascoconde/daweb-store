class Cart < ActiveRecord::Base
  has_many :products
  belongs_to :user

#  attr_accessible :products, :user


end
