class Photo < ActiveRecord::Base
  belongs_to :product

  attr_accessible :description, :url, :product_id
  
  validates :url, :presence => true

end
