class Photo < ActiveRecord::Base
  attr_accessible :description, :url, :product_id

  belongs_to :product
end
