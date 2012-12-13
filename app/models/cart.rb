class Cart < ActiveRecord::Base
  #attr_accessible :title, :body

  has_many :products
  belongs_to :user

end
