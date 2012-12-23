class User < ActiveRecord::Base
  
  has_one :cart
  has_many :reviews
  has_many :orders

  attr_accessible :email, :password, :username, :cart, :orders, :admin
  
  validates :email, :password, :username, :presence => true
  validates :email, :username, :uniqueness => true

  after_create :create_cart

  def create_cart
  	self.cart = Cart.create
  end
end
