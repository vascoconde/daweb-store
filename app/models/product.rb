class Product < ActiveRecord::Base
  has_many :reviews
  has_many :photos
  has_one :manufacturer
  has_one :category
  has_many :cart_items
  has_many :related_products, :class_name => "Product"
  
  belongs_to :category
  belongs_to :manufacturer
  
  attr_accessible :description, :name, :price, :manufacturer_id, 
	:category_id, :manufacturer, :category, :photos_attributes, :related_products
    
  accepts_nested_attributes_for :photos, :reviews, allow_destroy: true 

  validates :description, :name, :price, :manufacturer_id, :category_id,
              :presence => true
  validates :price, :numericality => { :greater_than => 0.01 }
              
  accepts_nested_attributes_for :photos
end
