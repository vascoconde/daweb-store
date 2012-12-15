class Product < ActiveRecord::Base
  has_many :reviews
  has_many :photos
  has_one :manufacturer
  has_one :category
  has_many :related_products, :class_name => "Product"
  attr_accessible :description, :name, :price, :manufacturer_id, 
	:category_id, :manufacturer, :category, :photos_attributes
    

  accepts_nested_attributes_for :photos, allow_destroy: true 

  belongs_to :category
  belongs_to :manufacturer

  validates :description, :name, :price, :manufacturer_id, :category_id,
              :presence => true
              
  accepts_nested_attributes_for :photos
end
