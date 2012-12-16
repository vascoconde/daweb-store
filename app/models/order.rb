class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check" , "Credit card" , "Purchase order" ]

  has_many :cart_items, :dependent => :destroy

  attr_accessible :address, :email, :name, :pay_type

  validates :address, :email, :name, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil
      cart_items << item
    end
  end

end
