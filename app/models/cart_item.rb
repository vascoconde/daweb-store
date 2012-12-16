class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  def total_price
    product.price * quantity
  end

  attr_accessible :cart, :product, :quantity, :product_id
end
