class CartItem < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :cart
  belongs_to :product
  attr_accessible :cart, :product
end
