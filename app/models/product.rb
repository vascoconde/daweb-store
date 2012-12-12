class Product < ActiveRecord::Base
  has_many :reviews
  has_many :photos
  has_many :related_products, :class_name => "Product"

  attr_accessible :description, :name, :price, :manufacturer_id, 
	:category_id, :manufacturer, :category, :photos
    


  belongs_to :category
  belongs_to :manufacturer

  validates :description, :name, :price, :manufacturer_id, :category_id,
              :presence => true
              
  accepts_nested_attributes_for :photos
end
