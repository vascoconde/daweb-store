class User < ActiveRecord::Base
	has_one :cart
  has_many :reviews

  attr_accessible :email, :password, :username, :cart
end
