class Cart < ActiveRecord::Base
  has_many :cart_items
  belongs_to :user

attr_accessible :cart_items
#  attr_accessible :products, :user

  # Check quantity of a product in cart and increment it if necessary
  def add_product(product_id)
    item = cart_items.find_by_product_id(product_id)
    if item
      item.quantity += 1
    else
      item = cart_items.build(:product_id => product_id)
    end
    item
  end

end
