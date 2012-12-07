class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :manufacturer_id
  attr_accessible :category_id, :manufacturer, :category, :photos_attributes
  has_many :reviews
  has_many :photos
  has_many :related_products, :class_name => "Product"

  belongs_to :category
  belongs_to :manufacturer

  validates :description, :name, :price, :manufacturer_id, :category_id,
              :presence => true
              
  accepts_nested_attributes_for :photos
end
