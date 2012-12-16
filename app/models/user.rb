class User < ActiveRecord::Base
	has_one :cart
  has_many :reviews
  has_many :orders

  attr_accessible :email, :password, :username, :cart, :orders
end
