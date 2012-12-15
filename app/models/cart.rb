class Cart < ActiveRecord::Base
  has_many :cart_items
  belongs_to :user

attr_accessible :cart_items
#  attr_accessible :products, :user


end
