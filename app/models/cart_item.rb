class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order
  
  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
  

  after_update :check_if_zero
  
  def check_if_zero
    if self.quantity.zero?
      self.destroy
    end
  end

  def total_price
    product.price * quantity
  end

  attr_accessible :cart, :product, :quantity, :product_id
end
